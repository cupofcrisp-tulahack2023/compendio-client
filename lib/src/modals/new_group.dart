import "package:flutter/material.dart";

class NewGroupModal extends StatelessWidget {
  const NewGroupModal({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 400,
        child: const Text("NEW GROUP"),
      ),
    );
  }
}
