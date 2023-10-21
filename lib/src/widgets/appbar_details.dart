import "package:compendio/src/modals/group_details.dart";
import "package:flutter/material.dart";

class AppBarDetailsWidget extends StatefulWidget {
  final String title;

  const AppBarDetailsWidget({super.key, required this.title});

  @override
  State<AppBarDetailsWidget> createState() =>
      _AppBarDetailsWidgetState(title: title);
}

class _AppBarDetailsWidgetState extends State<AppBarDetailsWidget> {
  bool showDetails = false;
  final String title;

  _AppBarDetailsWidgetState({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return const GroupDetailsModal();
          },
        );
      },
      child: Text(title),
    );
  }
}
