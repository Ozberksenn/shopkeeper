class UsersModel {
  int? userId;
  String? username;
  String? email;
  String? password;
  String? createdOn;
  String? userImage;

  UsersModel(
      {this.userId,
      this.username,
      this.email,
      this.password,
      this.createdOn,
      this.userImage});

  UsersModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    password = json['password'];
    createdOn = json['created_on'];
    userImage = json['user_image'];
  }
}
