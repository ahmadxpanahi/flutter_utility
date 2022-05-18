import 'package:flutter/foundation.dart';
import 'package:utilities/utilities.dart';

GetConnect getConnect = GetConnect(
  followRedirects: false,
  timeout: const Duration(minutes: 60),
  allowAutoSignedCert: true,
  sendUserAgent: true,
  userAgent: "SinaMN75",
  maxRedirects: 10,
  maxAuthRetries: 3,
);

Future<void> request<T>(
  final String url,
  final EHttpMethod httpMethod,
  final Function(Response<T> response) action,
  final Function(Response<T> response) error, {
  final dynamic body,
  final bool encodeBody = true,
  final Map<String, String>? headers,
}) async {
  final Map<String, String> header = <String, String>{"Authorization": getString(UtilitiesConstants.token) ?? ""};

  if (headers != null) header.addAll(headers);

  Response<T> response = Response<T>();
  try {
    dynamic params;
    if (body != null) {
      if (encodeBody)
        params = body.toJson();
      else
        params = body;
    }

    if (httpMethod == EHttpMethod.get) response = await getConnect.get(url, headers: header);
    if (httpMethod == EHttpMethod.post) response = await getConnect.post(url, params, headers: header);
    if (httpMethod == EHttpMethod.put) response = await getConnect.put(url, params, headers: header);
    if (httpMethod == EHttpMethod.patch) response = await getConnect.patch(url, params, headers: header);
    if (httpMethod == EHttpMethod.delete) response = await getConnect.delete(url, headers: header);
  } catch (e) {
    error(response);
    print(e);
  }

  if (kDebugMode) delay(100, () => response.log(params: (body == null || !encodeBody) ? "" : body.toJson()));
  if (response.isSuccessful())
    action(response);
  else
    error(response);
}

Future<void> get({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
}) async =>
    await request(url, EHttpMethod.get, action, error, headers: headers);

Future<void> post({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.post, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> put({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.put, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> patch({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
  dynamic body,
  bool encodeBody = true,
}) async =>
    await request(url, EHttpMethod.patch, action, error, body: body, encodeBody: encodeBody, headers: headers);

Future<void> delete({
  required String url,
  required action(Response response),
  required error(Response response),
  Map<String, String>? headers,
}) async =>
    await request(url, EHttpMethod.delete, action, error, headers: headers);

enum EHttpMethod { get, post, put, patch, delete }

extension HTTP<T> on Response<T> {
  bool isSuccessful() => (statusCode ?? 0) >= 200 && (statusCode ?? 0) <= 299 ? true : false;

  bool isServerError() => (statusCode ?? 0) >= 500 && (statusCode ?? 0) <= 599 ? true : false;

  void log({final String params = ""}) {
    logger.i(
      "${this.request!.method} - ${this.request!.url} - $statusCode \nPARAMS: $params \nRESPONSE: $body",
    );
  }

  void prettyLog({final String params = ""}) {
    logger.i(
      "${this.request!.method} - ${this.request!.url} - $statusCode \nPARAMS: ${JsonEncoder.withIndent(" ").convert(params)} \nRESPONSE: ${JsonEncoder.withIndent(" ").convert(body)}",
    );
  }
}
