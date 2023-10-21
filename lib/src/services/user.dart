import 'package:compendio/src/models/user.dart';

class UserService {
  User? profile;

  Future<User> getProfile() async {
    profile ??= await Future.delayed(
      const Duration(
        seconds: 1,
      ),
      () => User()
        ..phoneNumber = "+7 (123) 123-12-12"
        ..userName = "Username"
        ..userDescription = "User description"
        ..userID = "UserID",
    );
    return profile!;
  }
}
