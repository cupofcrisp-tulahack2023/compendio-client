import "package:compendio/src/pages/group.dart";
import "package:design_box/box.dart";
import "package:flutter/material.dart";

class BoxCardWidget extends StatelessWidget {
  final String title;
  final String description;

  const BoxCardWidget(
      {super.key, required this.title, this.description = "No description"});

  @override
  Widget build(BuildContext context) {
    return Box(
      padding: const EdgeInsets.all(10),
      color: const Color.fromRGBO(245, 245, 245, 1.0),
      radius: BorderRadius.circular(20),
      shadow: const BoxShadow(
        offset: Offset(2, 2),
        blurRadius: 2,
        color: Colors.grey,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title),
          Text(description),
        ],
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => GroupPage(
              title: title,
            ),
          ),
        );
      },
    );
  }
}
