import "package:compendio/src/modals/new_group.dart";
import "package:compendio/src/models/group.dart";
import "package:compendio/src/pages/base.dart";
import "package:compendio/src/providers/group/group_bloc.dart";
import "package:compendio/src/services/group.dart";
import "package:compendio/src/widgets/appbar_search.dart";
import "package:compendio/src/widgets/box_card.dart";
import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:get_it/get_it.dart";

class MyGroupsPage extends StatefulWidget {
  final GroupService groupService = GetIt.I<GroupService>();

  MyGroupsPage({super.key});

  @override
  State<MyGroupsPage> createState() =>
      _MyGroupsPageState(groupService: groupService);
}

class _MyGroupsPageState extends State<MyGroupsPage> {
  bool showFindField = false;
  final GroupService groupService;

  _MyGroupsPageState({required this.groupService});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        GroupBloc _bloc = GroupBloc();
        _bloc.add(NewGroupEvent());
        return _bloc;
      },
      child: Builder(
        builder: (BuildContext context) {
          List<Group>? groups = context.watch<GroupBloc>().state.groups;

          return BasePage(
            title: const AppBarSearchWidget(title: "Мои группы"),
            body: groups == null
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : groups.isNotEmpty
                    ? GridView(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        children: groups
                            .map(
                              (e) => BoxCardWidget(
                                name: e.name,
                                description: e.description,
                              ),
                            )
                            .toList(),
                      )
                    : const Center(
                        child: Text(
                          "Вы ещё не состоите ни в одной группе.",
                        ),
                      ),
            floating: FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (BuildContext ctx) {
                    return NewGroupModal(
                      bloc: BlocProvider.of<GroupBloc>(context),
                    );
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}
