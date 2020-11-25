import 'dart:convert';

import 'package:demo_api/Screen/post_screen.dart';
import 'package:flutter/material.dart';

import '../API/api.dart';
import '../Resource/user.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {

  var users = new List<User>();
  _getUsers() {
    GetUser.getUsers().then((response) {
      setState(() {
        Iterable list = json.decode(response.body);
        users = list.map((model) => User.fromJson(model)).toList();
      });
    });
  }

  initState() {
    super.initState();
    _getUsers();

  }

  dispose() {
    super.dispose();
  }

  @override
  build(context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User List"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return ListTile(title: Text(users[index].user_name),
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PostsScreen(user_id: users[index].user_id)
              ));
            },);

          },
        ),
    );
  }
}
