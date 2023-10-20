import "package:compendio/src/modals/base.dart";
import "package:flutter/material.dart";

class ProfileModal extends StatelessWidget {
  const ProfileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      height: 450,
      body: Column(
        children: <Widget>[
          const Row(
            children: <Widget>[
              SizedBox(
                height: 80,
                width: 80,
                child: CircleAvatar(
                  child: Icon(Icons.person_outline),
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text("Имя пользователя"),
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
                leading: Icon(Icons.message_rounded),
                title: Text("Lorem ipsum dolor sit amet"),
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
