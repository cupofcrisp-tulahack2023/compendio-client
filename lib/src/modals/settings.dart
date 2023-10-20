import "package:flutter/material.dart";

class SettingsModal extends StatelessWidget {
  const SettingsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300,
        child: const Text("SETTINGS"),
      ),
    );
  }
}
