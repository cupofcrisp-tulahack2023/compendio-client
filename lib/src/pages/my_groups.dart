import "package:compendio/src/pages/base.dart";
import "package:compendio/src/widgets/appbar_search.dart";
import "package:compendio/src/widgets/box_card.dart";
import "package:flutter/material.dart";

class MyGroupsPage extends StatefulWidget {
  const MyGroupsPage({super.key});

  @override
  State<MyGroupsPage> createState() => _MyGroupsPageState();
}

class _MyGroupsPageState extends State<MyGroupsPage> {
  bool showFindField = false;

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: const AppBarSearchWidget(
        title: "Мои группы",
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: const <Widget>[
          GridTile(
            child: BoxCardWidget(
              title: "A",
            ),
          ),
          GridTile(
            child: BoxCardWidget(
              title: "B",
            ),
          ),
          GridTile(
            child: BoxCardWidget(
              title: "C",
            ),
          ),
        ],
      ),
    );
  }
}
