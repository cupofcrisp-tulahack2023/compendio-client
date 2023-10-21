import "package:compendio/src/modals/base.dart";
import "package:flutter/material.dart";
import "package:material_text_fields/material_text_fields.dart";

class NewCompendioModal extends StatelessWidget {
  const NewCompendioModal({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      body: Column(
        children: [
          const Text("IMAGE PICKER"),
          const MaterialTextField(),
          const MaterialTextField(),
          ListTile(
            title: const Text("Доступность"),
            trailing: Switch(
              value: false,
              onChanged: (e) {},
            ),
          ),
        ],
      ),
    );
  }
}
