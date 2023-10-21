import 'dart:io';

import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker imagePicker = ImagePicker();

  Future<File> fromGallery() async {
    XFile? image = await imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 50,
        preferredCameraDevice: CameraDevice.front);
    return File(image!.path);
  }
}
