import "package:compendio/src/modals/new_group.dart";
import "package:compendio/src/modals/profile.dart";
import "package:compendio/src/modals/settings.dart";
import "package:compendio/src/pages/favourite.dart";
import "package:compendio/src/pages/my_groups.dart";
import "package:compendio/src/pages/notes.dart";
import "package:flutter/material.dart";

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

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
            child: GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const ProfileModal();
                  },
                );
              },
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      child: Icon(Icons.person_outline),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text("Имя пользователя"),
                  Text("ID пользователя"),
                ],
              ),
            ),
          ),
          ListTile(
              leading: const Icon(Icons.group_outlined),
              title: const Text("Мои группы"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyGroupsPage(),
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
