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
                  CircleAvatar(
                    child: Icon(Icons.person_outline),
                  ),
                  Text("Имя пользователя"),
                  Text("ID пользователя"),
                ],
              ),
            ),
          ),
          ListTile(
              leading: Icon(Icons.group_outlined),
              title: Text("Мои группы"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MyGroupsPage(),
                  ),
                );
              }),
          ListTile(
              leading: Icon(Icons.notes),
              title: Text("Заметки"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const NotesPage(),
                  ),
                );
              }),
          ListTile(
              leading: Icon(Icons.bookmark_outline_rounded),
              title: Text("Избранное"),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavouritePage(),
                  ),
                );
              }),
          ListTile(
            leading: Icon(Icons.add_outlined),
            title: Text("Создать новую группу"),
            onTap: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return const NewGroupModal();
                },
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.settings_outlined),
            title: Text("Настройки"),
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
