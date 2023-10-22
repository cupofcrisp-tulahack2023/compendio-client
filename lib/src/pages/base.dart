import "package:compendio/src/widgets/appbar.dart";
import "package:compendio/src/widgets/drawer.dart";
import "package:flutter/material.dart";

class BasePage extends StatelessWidget {
  final Widget title;
  final Widget body;
  final FloatingActionButton? floating;

  const BasePage(
      {super.key, required this.body, required this.title, this.floating});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: title,
      ),
      drawer: DrawerWidget(),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: body,
      ),
      floatingActionButton: floating,
    );
  }
}
