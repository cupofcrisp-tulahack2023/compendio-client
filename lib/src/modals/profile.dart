import "dart:io";

import "package:compendio/src/modals/base.dart";
import "package:compendio/src/services/image.dart";
import "package:flutter/material.dart";

class ProfileModal extends StatefulWidget {
  final ImageService imageService = ImageService();

  ProfileModal({super.key});

  @override
  State<ProfileModal> createState() =>
      _ProfileModalState(imageService: imageService);
}

class _ProfileModalState extends State<ProfileModal> {
  var _image;
  final ImageService imageService;

  _ProfileModalState({required this.imageService});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      height: 450,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              CircleAvatar(
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
                        ? const Icon(Icons.person_outline)
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
              ),
              const SizedBox(
                width: 30,
              ),
              const Text("Имя пользователя"),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const Divider(),
          ListView(
            shrinkWrap: true,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.message_rounded),
                title: const Text("Lorem ipsum dolor sit amet"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.phone_outlined),
                title: const Text("+7 (123) 123-12-12"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.edit_outlined),
                title: const Text("ID пользователя"),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text("Выйти из аккаунта"),
                onTap: () {},
              )
            ],
          ),
        ],
      ),
    );
  }
}
