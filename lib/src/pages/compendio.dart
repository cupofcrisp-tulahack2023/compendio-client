import "dart:io";

import "package:compendio/src/models/compendio.dart";
import "package:compendio/src/pages/base.dart";
import "package:flutter/material.dart";
import "package:photo_view/photo_view.dart";

class CompendioPage extends StatelessWidget {
  final Compendio comp;

  const CompendioPage({super.key, required this.comp});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: Text(comp.name),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            child: PhotoView(
              imageProvider: FileImage(
                File(comp.imagePath),
              ),
              heroAttributes: PhotoViewHeroAttributes(
                tag: comp.imagePath,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
