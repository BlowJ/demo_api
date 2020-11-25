class Post {
  String post_id;
  String post_content;
  String createdAt;

  Post(String post_id, String post_content, String createdAt) {
    this.post_id = post_id;
    this.post_content = post_content;
    this.createdAt = createdAt;
  }

  Post.fromJson(Map json)
      : post_id = json['post_id'],
        post_content = json['post_content'],
        createdAt = json['createdAt'];

  Map toJson() {
    return {'post_id': post_id, 'post_name': post_content, 'createdAt': createdAt};
  }
}
