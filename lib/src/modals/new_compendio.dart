import "dart:io";

import "package:compendio/src/modals/base.dart";
import "package:compendio/src/services/compendio.dart";
import "package:compendio/src/services/image.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:material_text_fields/material_text_fields.dart";

class NewCompendioModal extends StatefulWidget {
  final ImageService imageService = GetIt.I<ImageService>();
  final CompendioService compendioService = GetIt.I<CompendioService>();
  final String groupName;

  NewCompendioModal({super.key, required this.groupName});

  @override
  State<NewCompendioModal> createState() => _NewCompendioModalState(
        groupName: groupName,
        imageService: imageService,
        compendioService: compendioService,
      );
}

class _NewCompendioModalState extends State<NewCompendioModal> {
  var _image;
  String _name = "";
  String _desc = "";
  bool _access = false;
  final String groupName;
  final ImageService imageService;
  final CompendioService compendioService;

  _NewCompendioModalState(
      {required this.groupName,
      required this.imageService,
      required this.compendioService});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      body: Column(
        children: [
          _image == null
              ? ElevatedButton(
                  onPressed: () async {
                    File image = await imageService.fromGallery();
                    setState(() {
                      _image = image;
                    });
                  },
                  child: const Text("Загрузить фото"),
                )
              : Container(),
          MaterialTextField(
            labelText: "Название",
            onChanged: (e) {
              setState(() {
                _name = e;
              });
            },
          ),
          MaterialTextField(
            labelText: "Описание",
            onChanged: (e) {
              setState(() {
                _desc = e;
              });
            },
          ),
          ListTile(
            title: const Text("Доступность"),
            trailing: Switch(
              activeThumbImage: const NetworkImage(
                  "https://thumbs.dreamstime.com/z/%D0%B0%D0%B1%D1%81%D1%82%D1%80%D0%B0%D0%BA%D1%82%D0%BD%D0%B0%D1%8F-%D0%B8%D0%BB%D0%BB%D1%8E%D1%81%D1%82%D1%80%D0%B0%D1%86%D0%B8%D1%8F-%D0%B8%D0%BA%D0%BE%D0%BD%D1%8B-%D0%B4%D0%BE%D0%BB%D0%BB%D0%B0%D1%80%D0%B0-%D0%BF%D1%80%D0%B5%D0%B4%D0%BF%D0%BE%D1%81%D1%8B%D0%BB%D0%BA%D0%B8-d-%D0%B8%D0%B7%D0%BE%D0%BB%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BB%D0%B0-100796001.jpg"),
              inactiveThumbImage: const NetworkImage(
                "https://static.tildacdn.com/tild6530-3333-4561-a131-656235393636/png-transparent-chec.png",
              ),
              value: false,
              onChanged: (e) {},
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: () async {
              await compendioService.newCompendio(
                  groupName, _image, _name, _desc, _access);
              Navigator.pop(context, this);
            },
            child: const Text("Создать"),
          )
        ],
      ),
    );
  }
}
