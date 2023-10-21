import "package:flutter/material.dart";

class AppBarDetailsWidget extends StatefulWidget {
  final String title;
  final Widget modal;

  const AppBarDetailsWidget(
      {super.key, required this.title, required this.modal});

  @override
  State<AppBarDetailsWidget> createState() =>
      _AppBarDetailsWidgetState(title: title, modal: modal);
}

class _AppBarDetailsWidgetState extends State<AppBarDetailsWidget> {
  bool showDetails = false;
  final String title;
  final Widget modal;

  _AppBarDetailsWidgetState({required this.title, required this.modal});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return modal;
          },
        );
      },
      child: Text(title),
    );
  }
}
