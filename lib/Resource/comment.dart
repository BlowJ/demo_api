class Comment {
  String comment_id;
  String comment_content;
  String createdAt;

  Comment(String comment_id, String comment_content, String createdAt) {
    this.comment_id = comment_id;
    this.comment_content = comment_content;
    this.createdAt = createdAt;
  }

  Comment.fromJson(Map json)
      : comment_id = json['comment_id'],
        comment_content = json['comment_content'],
        createdAt = json['createdAt'];

  Map toJson() {
    return {'comment_id': comment_id, 'comment_name': comment_content, 'createdAt': createdAt};
  }
}
