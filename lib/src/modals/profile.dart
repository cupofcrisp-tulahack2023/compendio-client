import "package:flutter/material.dart";

class ProfileModal extends StatelessWidget {
  const ProfileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        child: const Text("PROFILE"),
      ),
    );
  }
}
