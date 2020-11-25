import 'dart:convert';
import 'package:demo_api/Resource/user.dart';
import 'package:demo_api/Resource/comment.dart';
import 'package:demo_api/Resource/user.dart';
import 'package:demo_api/Screen/home_screen.dart';
import 'package:flutter/material.dart';

import '../API/api.dart';
import '../Resource/user.dart';

class CommentsScreen extends StatefulWidget {
  CommentsScreen({this.user_id, this.post_id});
  String user_id;
  String post_id;
  @override
  CommentsScreenState createState() => CommentsScreenState(user_id, post_id);
}

class CommentsScreenState extends State<CommentsScreen> {
  var comments = new List<Comment>();

  CommentsScreenState(this.user_id, this.post_id);

  String user_id;
  String post_id;

  _getComments() {
    GetComment.getComments(int.parse(user_id), int.parse(post_id))
        .then((response) {
      // print(user_id);
      setState(() {
        Iterable list = json.decode(response.body);
        comments = list.map((model) => Comment.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getComments();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("comment List"),
      ),
      body: Column(
        children: <Widget>[
          ListView.builder(
            shrinkWrap: true,
            itemCount: comments.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(comments[index].comment_content),
              );
            },
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                PostaComment.postaComment(
                    int.parse(user_id), int.parse(post_id));
                _getComments();
              });
            },
            child: Icon(Icons.add),
          )
        ],
      ),
    );
  }
}
