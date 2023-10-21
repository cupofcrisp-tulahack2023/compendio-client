import "package:compendio/src/pages/base.dart";
import "package:compendio/src/widgets/box_card.dart";
import "package:flutter/material.dart";

class MyGroupsPage extends StatelessWidget {
  const MyGroupsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      title: "Мои группы",
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: const <Widget>[
          GridTile(
            child: BoxCard(
              title: "A",
            ),
          ),
          GridTile(
            child: BoxCard(
              title: "B",
            ),
          ),
          GridTile(
            child: BoxCard(
              title: "C",
            ),
          ),
        ],
      ),
    );
  }
}
