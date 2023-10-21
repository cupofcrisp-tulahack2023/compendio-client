import "package:compendio/src/modals/base.dart";
import "package:flutter/material.dart";
import "package:material_text_fields/material_text_fields.dart";
import "package:multi_select_flutter/multi_select_flutter.dart";

class NewGroupModal extends StatelessWidget {
  NewGroupModal({super.key});

  final List<String> tags = [
    "Физика",
    "Математика",
    "Информатика",
    "Начинающий уровень",
    "Продвинутый уровень",
    "Биология",
    "Анатомия",
    "Астрономия",
    "Программирование",
    "Музыка",
    "Кожевничество",
    "Кузнечное дело",
  ];

  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      height: 500,
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
          Expanded(
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
