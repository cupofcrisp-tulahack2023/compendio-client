import "package:compendio/src/modals/base.dart";
import "package:compendio/src/services/image.dart";
import "package:compendio/src/widgets/avatar_with_border.dart";
import "package:flutter/material.dart";

class ProfileModal extends StatelessWidget {
  final ImageService imageService = ImageService();

  ProfileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      height: 450,
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              AvatarWithBorderWidget(),
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
