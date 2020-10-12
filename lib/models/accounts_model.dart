import 'dart:convert';

class AccountsModel {
  String username;
  String email;
  String password;

  AccountsModel({this.username, this.email, this.password});

  factory AccountsModel.fromJson(Map<String, dynamic> map) {
    return AccountsModel(
        username: map["username"],
        email: map["email"],
        password: map["password"]);
  }

  Map<String, dynamic> toJson() {
    return {"username": username, "email": email, "password": password};
  }

  @override
  String toString() {
    return 'AccountsModel{username: $username, email: $email, password: $password}';
  }
}

List<AccountsModel> profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<AccountsModel>.from(
      data.map((item) => AccountsModel.fromJson(item)));
}

String profileToJson(AccountsModel data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
