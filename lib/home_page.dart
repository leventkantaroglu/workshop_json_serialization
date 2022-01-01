import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:workshop_json_serilatization/models/user_model.dart';
import 'package:http/http.dart' as http;

import 'models/member_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> userList = [];
  List<Member> memberList = [];

  @override
  void initState() {
    fetchList();
    super.initState();
  }

  fetchList() async {
    var url = Uri.parse("https://jsonplaceholder.typicode.com/users");
    var response = await http.get(url);
    List decodedResponse = jsonDecode(response.body);
    createMemberList(decodedResponse);
  }

  createMemberList(List response) {
    memberList = response.map((map) => Member.fromJson(map)).toList();
    setState(() {});
  }

  @Deprecated("Use createMemberList")
  createUserList(List response) {
    userList = response.map((map) => User.fromMap(map)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: memberList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(memberList[index].name),
          );
        },
      ),
    );
  }
}
