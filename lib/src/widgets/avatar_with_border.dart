import "dart:io";

import "package:compendio/src/services/image.dart";
import "package:flutter/material.dart";

class AvatarWithBorderWidget extends StatefulWidget {
  final ImageService imageService = ImageService();
  final String avatarPath;

  AvatarWithBorderWidget({super.key, required this.avatarPath});

  @override
  State<AvatarWithBorderWidget> createState() => _AvatarWithBorderWidgetState(
      imageService: imageService, avatarPath: avatarPath);
}

class _AvatarWithBorderWidgetState extends State<AvatarWithBorderWidget> {
  final ImageService imageService;
  final String avatarPath;
  var _image;

  _AvatarWithBorderWidgetState(
      {required this.imageService, required this.avatarPath});

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
              ? avatarPath.isEmpty
                  ? const Icon(Icons.camera_alt_outlined)
                  : Container(
                      width: 100,
                      height: 100,
                      child: ClipOval(
                        child: Image.file(
                          File(avatarPath),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    )
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
