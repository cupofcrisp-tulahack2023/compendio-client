import 'dart:io';

import 'package:compendio/src/models/compendio.dart';
import 'package:compendio/src/services/group.dart';
import 'package:get_it/get_it.dart';

class CompendioService {
  final GroupService groupService = GetIt.I<GroupService>();

  Future<void> newCompendio(String groupName, File image, String name,
      String desc, bool access) async {
    Compendio comp = Compendio()
      ..name = name
      ..description = desc
      ..access = access
      ..imagePath = image.path;

    groupService.addCompendioToGroup(groupName, comp);
  }
}
