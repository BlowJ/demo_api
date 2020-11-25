import 'dart:async';
import 'package:http/http.dart' as http;


const baseUrl = "https://5fbb8506c09c200016d409a7.mockapi.io/api/v1/";


class GetUser {
  static Future getUsers() {
    var url = baseUrl + "/Users";
    return http.get(url);
  }
}

class GetPost {
  static Future getPosts(int uId) {
    var url = baseUrl + "/Users/$uId/Posts";
    print(url);
    return http.get(url);
  }
}

class GetComment {
  static Future getComments(int uId, int pId) {
    var url = baseUrl + "/Users/$uId/Posts/$pId/Comments";
    print(url);
    return http.get(url);
  }
}

class PostaPost {
  static Future postaPost(int uId) {
    var url = baseUrl + "/Users/$uId/Posts";
    print(url);
    return http.post(url);
  }
}

class PostaComment {
  static Future postaComment(int uId, int pId) {
    var url = baseUrl + "/Users/$uId/Posts/$pId/Comments";
    print(url);
    return http.post(url);
  }
}