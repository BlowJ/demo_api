import 'dart:convert';
import 'package:demo_api/Resource/user.dart';
import 'package:demo_api/Resource/post.dart';
import 'package:demo_api/Resource/user.dart';
import 'package:demo_api/Screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../API/api.dart';
import '../Resource/user.dart';
import 'comment_screen.dart';

class PostsScreen extends StatefulWidget {
  PostsScreen({this.user_id});
  String user_id;

  @override
  PostsScreenState createState() => PostsScreenState(user_id);
}

class PostsScreenState extends State<PostsScreen> {
  var posts = new List<Post>();

  PostsScreenState(this.user_id);

  String user_id;

  _getPosts() {
    GetPost.getPosts(int.parse(user_id)).then((response) {
      // print(user_id);
      setState(() {
        Iterable list = json.decode(response.body);
        posts = list.map((model) => Post.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getPosts();
  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("post List"),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            ListView.builder(
              shrinkWrap: true,
              itemCount: posts.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(posts[index].post_content),
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CommentsScreen(
                                user_id: user_id,
                                post_id: posts[index].post_id)));
                  },
                );
              },
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  PostaPost.postaPost(int.parse(user_id));
                  _getPosts();
                });
              },
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
