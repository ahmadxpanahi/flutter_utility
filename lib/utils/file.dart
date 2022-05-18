import 'dart:io';

import 'package:utilities/utilities.dart';

void showFilePicker({
  required final Function(List<File> file) action,
  final FileType fileType = FileType.image,
  final bool allowMultiple = false,
}) async {
  final FilePickerResult? result = await FilePicker.platform.pickFiles(type: fileType, allowMultiple: allowMultiple);
  if (result != null) {
    if (allowMultiple) {
      final List<File> files = <File>[];
      result.files.forEach((final PlatformFile i) {
        if (i.path != null) files.add(File(i.path!));
      });
    } else {
      final File file = File(result.files.single.path!);
      action(<File>[file]);
    }
  }
}

Future<CroppedFile?> cropImage({
  required File file,
  Function(CroppedFile file)? action,
  int? maxWidth,
  int? maxHeight,
  CropAspectRatio cropAspectRatio = const CropAspectRatio(ratioX: 3.0, ratioY: 1.2),
  ImageCompressFormat imageCompressFormat = ImageCompressFormat.png,
  AndroidUiSettings? androidUiSettings,
  IOSUiSettings? iOSUiSettings,
  List<CropAspectRatioPreset> aspectRatioPresets = const <CropAspectRatioPreset>[
    CropAspectRatioPreset.original,
    CropAspectRatioPreset.square,
    CropAspectRatioPreset.ratio3x2,
    CropAspectRatioPreset.ratio4x3,
    CropAspectRatioPreset.ratio16x9,
  ],
}) async {
  final CroppedFile? result = await ImageCropper().cropImage(
    sourcePath: file.path,
    maxWidth: maxWidth,
    maxHeight: maxHeight,
    aspectRatio: cropAspectRatio,
    compressFormat: imageCompressFormat,
    cropStyle: CropStyle.rectangle,
    compressQuality: 90,
    aspectRatioPresets: aspectRatioPresets,
    uiSettings: [
      androidUiSettings ??
          AndroidUiSettings(
            toolbarTitle: 'Crop Your Image',
            showCropGrid: true,
            hideBottomControls: false,
            lockAspectRatio: true,
            initAspectRatio: CropAspectRatioPreset.square,
            activeControlsWidgetColor: context.theme.primaryColor,
            statusBarColor: context.theme.primaryColor,
            toolbarColor: context.theme.primaryColor,
            toolbarWidgetColor: context.theme.cardColor,
          ),
      iOSUiSettings ??
          IOSUiSettings(
            resetAspectRatioEnabled: false,
            minimumAspectRatio: 1.0,
            aspectRatioPickerButtonHidden: true,
            title: 'Crop Your Image',
            aspectRatioLockDimensionSwapEnabled: true,
            aspectRatioLockEnabled: true,
            hidesNavigationBar: true,
          ),
    ],
  );
  if (action != null) action(result!);
  return result;
}
