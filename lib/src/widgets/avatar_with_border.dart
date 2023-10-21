import "dart:io";

import "package:compendio/src/services/image.dart";
import "package:flutter/material.dart";

class AvatarWithBorderWidget extends StatefulWidget {
  final ImageService imageService = ImageService();

  AvatarWithBorderWidget({super.key});

  @override
  State<AvatarWithBorderWidget> createState() =>
      _AvatarWithBorderWidgetState(imageService: imageService);
}

class _AvatarWithBorderWidgetState extends State<AvatarWithBorderWidget> {
  final ImageService imageService;
  var _image;

  _AvatarWithBorderWidgetState({required this.imageService});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 40,
      backgroundColor: Colors.grey,
      child: GestureDetector(
        onTap: () async {
          File image = await imageService.fromGallery();
          setState(() {
            _image = File(image.path);
          });
        },
        child: CircleAvatar(
          radius: 38,
          child: _image == null
              ? const Icon(Icons.camera_alt_outlined)
              : Container(
                  width: 100,
                  height: 100,
                  child: ClipOval(
                    child: Image.file(
                      _image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
