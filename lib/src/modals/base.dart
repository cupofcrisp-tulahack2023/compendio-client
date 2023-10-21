import "package:flutter/material.dart";

class BaseModal extends StatelessWidget {
  final Widget body;
  final double height;
  final double padding;

  const BaseModal(
      {super.key,
      required this.body,
      this.height = double.nan,
      this.padding = 30});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        padding: EdgeInsets.all(padding),
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            body,
          ],
        ),
      ),
    );
  }
}
