import 'package:compendio/src/models/user.dart';
import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';

class UserService {
  User? profile;

  final LocalStorage localStorage = GetIt.I<LocalStorage>();

  Future<User> getProfile() async {
    if (profile == null) {
      profile = User()
        ..avatarPath = ""
        ..phoneNumber = "+7 (123) 123-12-12"
        ..userName = "Username"
        ..userDescription = "User description"
        ..userID = "UserID";
      localStorage.setItem("profile", profile);
    }

    return await Future.delayed(
      const Duration(
        seconds: 1,
      ),
          () => localStorage.getItem("profile"),);
  }
}
