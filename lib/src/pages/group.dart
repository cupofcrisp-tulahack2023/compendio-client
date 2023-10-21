import "package:compendio/src/modals/group_details.dart";
import "package:compendio/src/modals/new_compendio.dart";
import "package:compendio/src/models/group.dart";
import "package:compendio/src/pages/base.dart";
import "package:compendio/src/services/group.dart";
import "package:compendio/src/widgets/appbar_details.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";

class GroupPage extends StatefulWidget {
  final String name;
  final GroupService groupService = GetIt.I<GroupService>();

  GroupPage({super.key, required this.name});

  @override
  State<GroupPage> createState() =>
      _GroupPageState(groupService: groupService, name: name);
}

class _GroupPageState extends State<GroupPage> {
  final GroupService groupService;
  final String name;
  late Future<Group> group;

  _GroupPageState({required this.groupService, required this.name});

  @override
  void initState() {
    super.initState();
    group = groupService.getGroupByName(name);
  }

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: AppBarDetailsWidget(
        title: widget.name,
        modal: FutureBuilder(
          future: group,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Group data = snapshot.data!;
              return GroupDetailsModal(
                group: data,
              );
            } else if (snapshot.hasError) {}

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
      body: Text("GROUP ${widget.name}"),
      floating: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return const NewCompendioModal();
            },
          );
        },
        child: const Icon(Icons.add_outlined),
      ),
    );
  }
}
