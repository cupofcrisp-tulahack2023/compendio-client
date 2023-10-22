import "package:compendio/src/modals/base.dart";
import "package:compendio/src/models/user.dart";
import "package:compendio/src/services/image.dart";
import "package:compendio/src/services/user.dart";
import "package:compendio/src/widgets/avatar_with_border.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

class ProfileModal extends StatefulWidget {

  ProfileModal({super.key});

  @override
  State<ProfileModal> createState() => _ProfileModalState();
}

class _ProfileModalState extends State<ProfileModal> {
  final ImageService imageService = GetIt.I<ImageService>();

  final UserService userService = GetIt.I<UserService>();

  late Future<User> user;

  @override
  void initState() {
    super.initState();
    user = userService.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      height: 450,
      body: Column(
        children: <Widget>[
          FutureBuilder(
            future: user,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                User data = snapshot.data!;
                return Row(
                  children: <Widget>[
                    AvatarWithBorderWidget(
                      avatarPath: data.avatarPath,
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Text(data.userName),
                  ],
                );
              }
              return const CircularProgressIndicator();
            },
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
