import 'package:flutter/material.dart';
import 'package:utilities/utilities.dart';

export 'dart:async';
export 'dart:convert';

export 'package:file_picker/file_picker.dart';
export 'package:flutter_local_notifications/flutter_local_notifications.dart';
export 'package:flutter_svg/flutter_svg.dart';
export 'package:get/get.dart';
export 'package:get_storage/get_storage.dart';
export 'package:group_button/group_button.dart';
export 'package:image_cropper/image_cropper.dart';
export 'package:intl/intl.dart';
export 'package:logger/logger.dart';
export 'package:path_provider/path_provider.dart';
export 'package:persian_tools/persian_tools.dart';
export 'package:share_plus/share_plus.dart';
export 'package:url_launcher/url_launcher.dart';

export 'components/components.dart';
export 'utils/utils.dart';
export 'view_models/view_models.dart';

void initUtilities() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
}
