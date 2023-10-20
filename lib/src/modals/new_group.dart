import "package:compendio/src/modals/base.dart";
import "package:flutter/material.dart";

class NewGroupModal extends StatelessWidget {
  const NewGroupModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseModal(
      height: 400,
      body: Text("NEW GROUP"),
    );
  }
}
