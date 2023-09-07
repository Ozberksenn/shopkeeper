class UserModel {
  int? userId;
  String? username;
  String? email;
  DateTime? createdOn;

  UserModel({this.userId, this.username, this.email, this.createdOn});

  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    createdOn = DateTime.parse(json["created_on"]);
  }
}
