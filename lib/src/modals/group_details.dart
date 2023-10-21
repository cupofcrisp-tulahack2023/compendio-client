import "package:compendio/src/modals/base.dart";
import "package:compendio/src/models/group.dart";
import "package:flutter/material.dart";

class GroupDetailsModal extends StatelessWidget {
  final Group group;

  const GroupDetailsModal({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("IMAGE"),
          const Divider(),
          Text(group.name),
          ListTile(
            leading: const Icon(Icons.edit_outlined),
            title: Text(group.description),
          ),
          const Divider(),
          const Text("Теги"),
          group.tags.isNotEmpty
              ? GridView(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  children: group.tags
                      .map((e) => Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.green),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            height: 10,
                          ))
                      .toList(),
                )
              : const Text("Нет тегов..."),
          const Divider(),
          const Text("Участники"),
          group.members.isNotEmpty
              ? SingleChildScrollView(
                  child: ListView(
                    shrinkWrap: true,
                    children: group.members
                        .map(
                          (e) => ListTile(
                            leading: const CircleAvatar(
                              child: Icon(Icons.person_outline),
                            ),
                            title: Text(e.userName),
                          ),
                        )
                        .toList(),
                  ),
                )
              : Text("Нет участников...")
        ],
      ),
    );
  }
}
