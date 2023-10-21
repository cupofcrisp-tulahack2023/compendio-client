import "package:compendio/src/models/group.dart";
import "package:compendio/src/pages/base.dart";
import "package:compendio/src/services/group.dart";
import "package:compendio/src/widgets/appbar_search.dart";
import "package:compendio/src/widgets/box_card.dart";
import "package:flutter/material.dart";

class MyGroupsPage extends StatefulWidget {
  final GroupService groupService = GroupService();

  MyGroupsPage({super.key});

  @override
  State<MyGroupsPage> createState() =>
      _MyGroupsPageState(groupService: groupService);
}

class _MyGroupsPageState extends State<MyGroupsPage> {
  bool showFindField = false;
  late Future<List<Group>> groups;
  final GroupService groupService;

  _MyGroupsPageState({required this.groupService});

  @override
  void initState() {
    super.initState();
    groups = groupService.getGroups();
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: const AppBarSearchWidget(
        title: "Мои группы",
      ),
      body: FutureBuilder<List<Group>>(
        future: groups,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Group> data = snapshot.data!;
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              children: data
                  .map(
                    (e) => BoxCardWidget(
                      name: e.name,
                      description: e.description,
                    ),
                  )
                  .toList(),
            );
          } else if (snapshot.hasError) {}
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
