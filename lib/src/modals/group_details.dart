import "package:compendio/src/modals/base.dart";
import "package:flutter/material.dart";

class GroupDetailsModal extends StatelessWidget {
  const GroupDetailsModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseModal(
      body: Text("GROUP DETAILS"),
    );
  }
}
