import "package:animated_shimmer/animated_shimmer.dart";
import "package:compendio/src/modals/new_group.dart";
import "package:compendio/src/modals/profile.dart";
import "package:compendio/src/modals/settings.dart";
import "package:compendio/src/models/user.dart";
import "package:compendio/src/pages/favourite.dart";
import "package:compendio/src/pages/my_groups.dart";
import "package:compendio/src/pages/notes.dart";
import "package:compendio/src/services/user.dart";
import "package:flutter/material.dart";

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final UserService userService = UserService();
  late Future<User> user;

  @override
  void initState() {
    super.initState();
    user = userService.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.rectangle,
            ),
            child: FutureBuilder<User>(
                future: user,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    User data = snapshot.data!;
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return const ProfileModal();
                          },
                        );
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 60,
                            width: 60,
                            child: CircleAvatar(
                              child: Icon(Icons.person_outline),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(data.userName),
                          Text(data.userID),
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {}

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      AnimatedShimmer(
                        width: 60,
                        height: 60,
                        borderRadius: BorderRadius.circular(60),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AnimatedShimmer(
                        width: 150,
                        height: 14,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      AnimatedShimmer(
                        width: 100,
                        height: 14,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ],
                  );
                }),
          ),
          ListTile(
              leading: const Icon(Icons.group_outlined),
              title: const Text("Мои группы"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyGroupsPage(),
                  ),
                );
              }),
          ListTile(
              leading: const Icon(Icons.notes),
              title: const Text("Заметки"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotesPage(),
                  ),
                );
              }),
          ListTile(
              leading: const Icon(Icons.bookmark_outline_rounded),
              title: const Text("Избранное"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouritePage(),
                  ),
                );
              }),
          ListTile(
            leading: const Icon(Icons.add_outlined),
            title: const Text("Создать новую группу"),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return NewGroupModal();
                },
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings_outlined),
            title: const Text("Настройки"),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const SettingsModal();
                },
              );
            },
          ),
          const ListTile(
            leading: Icon(Icons.nightlight_outlined),
            title: Text("Ночной режим"),
            trailing: Switch(value: false, onChanged: null),
          ),
        ],
      ),
    );
  }
}
