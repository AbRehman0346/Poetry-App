class UserFields{
  String name = "name";
  String email = "email";
  String password = "password";
  String confirmPassword = "confirmPassword";
  String role = "role";
}

class UserRoles{
  String user = "user";
  String admin = "admin";
}

class UserModel {
  String name;
  String email;
  String password;
  String role;

  UserModel({
    required this.name,
    required this.email,
    required this.password,
    required this.role,
  });


  Map<String, dynamic> toJson() {
    var f = UserFields();
    return {
      f.name: name,
      f.email: email,
      f.password: password,
      f.role: role,
    };
  }


  factory UserModel.fromJson(Map<String, dynamic> json) {
    final f = UserFields();
    return UserModel(
      name: json[f.name],
      email: json[f.email],
      password: json[f.password],
      role: json[f.role],
    );
  }
}