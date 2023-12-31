import "package:compendio/src/modals/base.dart";
import "package:compendio/src/providers/group/group_bloc.dart";
import "package:compendio/src/services/group.dart";
import "package:compendio/src/services/tag.dart";
import "package:flutter/material.dart";
import "package:get_it/get_it.dart";
import "package:material_text_fields/material_text_fields.dart";
import "package:multi_select_flutter/multi_select_flutter.dart";

class NewGroupModal extends StatefulWidget {
  final TagService tagService = GetIt.I<TagService>();
  final GroupService groupService = GetIt.I<GroupService>();
  final GroupBloc bloc;

  NewGroupModal({super.key, required this.bloc});

  @override
  State<NewGroupModal> createState() => _NewGroupModalState(
        tagService: tagService,
        groupService: groupService,
        bloc: bloc,
      );
}

class _NewGroupModalState extends State<NewGroupModal> {
  final TagService tagService;
  final GroupService groupService;
  final GroupBloc bloc;
  late Future<List<String>> tags;

  _NewGroupModalState({
    required this.tagService,
    required this.groupService,
    required this.bloc,
  });

  @override
  void initState() {
    super.initState();
    tags = tagService.getTags();
  }

  List<String> _selectedTags = [];
  String _input = "";

  @override
  Widget build(BuildContext context) {
    return BaseModal(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Новая группа"),
          MaterialTextField(
            keyboardType: TextInputType.name,
            labelText: "Название",
            textInputAction: TextInputAction.next,
            prefixIcon: const Icon(Icons.edit_outlined),
            onChanged: (e) {
              setState(() {
                _input = e;
              });
            },
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
                      items: data.map((e) => MultiSelectItem(e, e)).toList(),
                      listType: MultiSelectListType.CHIP,
                      onConfirm: (values) {
                        _selectedTags = values;
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Placeholder();
                  }
                  return const Center(
                    heightFactor: 3,
                    child: CircularProgressIndicator(),
                  );
                },
              ),
            ),
          ),
          const SizedBox(height: 10),
          Container(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () async {
                await groupService.createGroup(_input, _selectedTags);
                bloc.add(NewGroupEvent());
                Navigator.pop(context, this);
              },
              // await Navigator.push(
              //   context,
              //   MaterialPageRoute(
              //     builder: (context) => GroupPage(
              //       name: _input,
              //     ),
              //   ),
              child: const Text("Создать"),
            ),
          ),
        ],
      ),
    );
  }
}
