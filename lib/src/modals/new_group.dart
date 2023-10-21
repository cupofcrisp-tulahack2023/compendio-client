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
  late Future<List<String>> tags;

  _NewGroupModalState({required this.tagService});

  @override
  void initState() {
    super.initState();
    tags = tagService.getTags();
  }

  List<String> selectedTags = [];

  @override
  Widget build(BuildContext context) {
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
                child: FutureBuilder<List<String>>(
                    future: tags,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<String> data = snapshot.data!;
                        return MultiSelectDialogField(
                          title: const Text("Теги"),
                          confirmText: const Text("Далее"),
                          cancelText: const Text("Назад"),
                          buttonText: const Text("Выберите теги"),
                          dialogHeight: 500,
                          items:
                              data.map((e) => MultiSelectItem(e, e)).toList(),
                          listType: MultiSelectListType.CHIP,
                          onConfirm: (values) {
                            selectedTags = values;
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Placeholder();
                      }
                      return const Center(
                        heightFactor: 3,
                        child: CircularProgressIndicator(),
                      );
                    })),
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
