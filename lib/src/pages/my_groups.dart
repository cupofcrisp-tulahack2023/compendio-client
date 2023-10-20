import "package:compendio/src/pages/base.dart";
import "package:flutter/material.dart";

class MyGroupsPage extends StatelessWidget {
  const MyGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: "Мои группы",
      body: Text("MY GROUPS"),
    );
  }
}
