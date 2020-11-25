class User {
  String user_id;
  String user_name;
  String createdAt;

  User(String user_id, String user_name, String createdAt) {
    this.user_id = user_id;
    this.user_name = user_name;
    this.createdAt = createdAt;
  }



  User.fromJson(Map json)
      : user_id = json['user_id'],
        user_name = json['user_name'],
        createdAt = json['createdAt'];

  Map toJson() {
    return {'user_id': user_id, 'user_name': user_name, 'createdAt': createdAt};
  }
  String get UserId => user_id;
}
