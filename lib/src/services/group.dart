import 'package:compendio/src/models/group.dart';

class GroupService {
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
}
