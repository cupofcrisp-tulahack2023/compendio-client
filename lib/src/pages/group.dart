import "package:compendio/src/pages/base.dart";
import "package:flutter/material.dart";

class GroupPage extends StatelessWidget {
  final String title;

  const GroupPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: title,
      body: Text("GROUP " + title),
    );
  }
}
