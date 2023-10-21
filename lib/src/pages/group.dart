import "package:compendio/src/modals/new_compendio.dart";
import "package:compendio/src/pages/base.dart";
import "package:compendio/src/widgets/appbar_details.dart";
import "package:flutter/material.dart";

class GroupPage extends StatelessWidget {
  final String title;

  const GroupPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: AppBarDetailsWidget(
        title: title,
      ),
      body: Text("GROUP $title"),
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
