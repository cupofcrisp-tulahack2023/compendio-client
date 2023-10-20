import "package:compendio/src/modals/base.dart";
import "package:flutter/material.dart";

class ProfileModal extends StatelessWidget {
  const ProfileModal({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseModal(
      height: 400,
      body: Text("PROFILE"),
    );
  }
}
