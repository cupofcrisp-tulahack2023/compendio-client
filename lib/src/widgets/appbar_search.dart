import "package:flutter/material.dart";

class AppBarSearchWidget extends StatefulWidget {
  final String title;

  const AppBarSearchWidget({super.key, required this.title});

  @override
  State<AppBarSearchWidget> createState() =>
      _AppBarSearchWidgetState(title: title);
}

class _AppBarSearchWidgetState extends State<AppBarSearchWidget> {
  final String title;
  bool showFindField = false;

  _AppBarSearchWidgetState({required this.title});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          showFindField = true;
        });
      },
      child: showFindField
          ? TextField(
              autofocus: true,
              decoration: const InputDecoration(
                icon: Icon(Icons.search),
              ),
              onTapOutside: (event) {
                setState(() {
                  showFindField = false;
                });
              },
            )
          : Text(title),
    );
  }
}
