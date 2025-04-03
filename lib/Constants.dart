import 'models/user_model.dart';

class Constants{
  static UserModel? user;

  static bool get isLoggedIn {
    return user != null;
  }

  static bool get isAdmin {
    if(user == null) return false;
    return user!.role == UserRoles().admin;
  }
}