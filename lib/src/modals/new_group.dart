import "package:compendio/src/modals/base.dart";
import "package:compendio/src/services/tag.dart";
import "package:flutter/material.dart";
import "package:material_text_fields/material_text_fields.dart";
import "package:multi_select_flutter/multi_select_flutter.dart";

class NewGroupModal extends StatefulWidget {
  final TagService tagService = TagService();

  NewGroupModal({super.key});

  @override
  State<NewGroupModal> createState() => _NewGroupModalState(
        tagService: tagService,
      );
}

class _NewGroupModalState extends State<NewGroupModal> {
  final TagService tagService;

  _NewGroupModalState({required this.tagService}) {}

  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    List<String> tags = tagService.getTags();
    return BaseModal(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Новая группа"),
          const MaterialTextField(
            keyboardType: TextInputType.name,
            labelText: "Название",
            textInputAction: TextInputAction.next,
            prefixIcon: Icon(Icons.edit_outlined),
          ),
          Container(
            height: 300,
            child: SingleChildScrollView(
              child: MultiSelectDialogField(
                title: const Text("Теги"),
                confirmText: const Text("Далее"),
                cancelText: const Text("Назад"),
                buttonText: const Text("Выберите теги"),
                dialogHeight: 500,
                items: tags.map((e) => MultiSelectItem(e, e)).toList(),
                listType: MultiSelectListType.CHIP,
                onConfirm: (values) {
                  selectedTags = values;
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {},
              child: const Text("Создать"),
            ),
          ),
        ],
      ),
    );
  }
}
