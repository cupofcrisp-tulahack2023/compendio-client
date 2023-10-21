import "package:compendio/src/widgets/appbar.dart";
import "package:compendio/src/widgets/drawer.dart";
import "package:flutter/material.dart";

class BasePage extends StatelessWidget {
  final Widget body;
  final String title;

  const BasePage({super.key, required this.body, required this.title});

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
    );
  }
}
