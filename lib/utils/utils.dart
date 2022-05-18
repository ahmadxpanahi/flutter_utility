import 'dart:ui';

import 'package:utilities/utilities.dart';

export 'extensions/align_extension.dart';
export 'extensions/date_extension.dart';
export 'extensions/extension.dart';
export 'extensions/file_extension.dart';
export 'extensions/iterable_extension.dart';
export 'extensions/number_extension.dart';
export 'extensions/string_extension.dart';
export 'extensions/text_extension.dart';
export 'extensions/widget_extension.dart';
export 'constants.dart';
export 'file.dart';
export 'file_downloader.dart';
export 'get.dart';
export 'http_interceptor.dart';
export 'launch.dart';
export 'local_storage.dart';
export 'share.dart';

Logger logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 4,
    lineLength: 400,
    colors: true,
    printEmojis: true,
    printTime: false,
    noBoxingByDefault: true,
  ),
);

void delay(final int milliseconds, final VoidCallback action) async => Future<dynamic>.delayed(
      Duration(milliseconds: milliseconds),
      () async => action(),
    );
