import 'package:compendio/src/models/compendio.dart';
import 'package:compendio/src/models/group.dart';
import 'package:flutter/cupertino.dart';

class GroupService extends ChangeNotifier {
  GroupService() {
    print("GROUP SERVICE CREATED");
  }

  List<Group> groups = [
    Group()
      ..name = "A"
      ..description = "Description to A",
    Group()
      ..name = "B"
      ..description = "Description to B",
    Group()
      ..name = "C"
      ..description = "Description to C",
    Group()
      ..name = "D"
      ..description = "Description to D",
  ];

  Future<List<Group>> getGroups() {
    return Future.delayed(const Duration(seconds: 2), () => groups);
  }

  Future<Group> getGroupByName(String name) {
    return Future.delayed(const Duration(seconds: 2),
        () => groups.firstWhere((element) => element.name == name));
  }

  Future<void> createGroup(String name, List<String> tags) async {
    groups.add(
      Group()
        ..name = name
        ..tags = tags,
    );
  }

  Future<void> addCompendioToGroup(String name, Compendio comp) async {
    int index = groups.indexWhere((element) => element.name == name);
    groups[index].compendios.add(comp);
  }
}
