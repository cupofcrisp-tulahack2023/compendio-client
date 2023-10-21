import 'package:compendio/src/models/compendio.dart';
import 'package:compendio/src/models/user.dart';

class Group {
  String image = "";
  String name = "";
  String description = "";
  List<String> tags = [];
  List<User> members = [];
  List<Compendio> compendios = [];
}
