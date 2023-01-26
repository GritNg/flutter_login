import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

class MyProfilePage extends StatefulWidget {
  //const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  String? txtUsername = "";
  String? txtPassword = "";
  String? txtStatus = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsername();
    getPassword();
    getStatus();
  }

  Widget build(BuildContext context) {
    return Scaffold(body: ListView(children: [Text("${txtUsername} and ${txtPassword}")]),);
  }

  Future<void> getUsername() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('username');
    setState(() {
      txtUsername = myStr;
    });
  }

  Future<void> getPassword() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('password');
    setState(() {
      txtPassword = myStr;
    });
  }

  Future<void> getStatus() async {
    var pref = await SharedPreferences.getInstance();
    var myStr = pref.getString('status');
    setState(() {
      txtStatus = myStr;
    });
  }
}
