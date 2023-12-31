import "package:flutter/material.dart";

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Widget title;

  const AppBarWidget({super.key, required this.title})
      : preferredSize = const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}
