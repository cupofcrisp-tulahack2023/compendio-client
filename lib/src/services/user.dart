import 'package:compendio/src/models/user.dart';

class UserService {
  Future<User> getUser() async {
    return Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () => User()
        ..phoneNumber = "+7 (123) 123-12-12"
        ..userName = "Username"
        ..userDescription = "User description"
        ..userID = "UserID",
    );
  }
}
