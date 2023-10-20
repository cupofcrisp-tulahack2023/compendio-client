import "package:compendio/src/pages/base.dart";
import "package:flutter/material.dart";

class NotesPage extends StatelessWidget {
  const NotesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      title: "Заметки",
      body: Text("NOTES"),
    );
  }
}
