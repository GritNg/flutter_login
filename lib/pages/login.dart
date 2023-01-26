import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:registerapp/pages/profile.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  //const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Scaffold(
        body: ListView(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Login',
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blueGrey,
                  fontSize: 30),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 15,
            ),
            Image.network(
              'https://cdn-icons-png.flaticon.com/512/2002/2002066.png',
              height: 150,
              width: 150,
            ),
            SizedBox(
              height: 50,
            ),
            TextField(
                controller: username,
                decoration: InputDecoration(
                    labelText: 'UserName', border: OutlineInputBorder())),
            SizedBox(
              height: 15,
            ),
            TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                    labelText: 'Password', border: OutlineInputBorder())),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                if (username.text == "admin" && password.text == "1234") {
                  print("USERNAME = ${username.text}, PASSWORD = ${password.text}");
                  setState(() {
                    username.text = 'admin';
                    password.text = '1234';

                    setUsername(username.text);
                    setPassword(password.text);
                    setStatus("Login Success");
                  });
                } else {
                  print("USER = other");
/*                   setUsername("failed");
                  setPassword("failed"); */
                  setStatus("Login Failed");
                }
              },
              child: Text("เข้าสู่ระบบ"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyProfilePage()));
              },
              child: Text("ไปหน้า Profile"),
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.blueGrey),
                  padding: MaterialStateProperty.all(
                      EdgeInsets.fromLTRB(50, 20, 50, 20)),
                  textStyle:
                      MaterialStateProperty.all(TextStyle(fontSize: 30))),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setUsername(textUsername) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('username', textUsername);
  }

  Future<void> setPassword(textPassword) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('password', textPassword);
  }

  Future<void> setStatus(textstatus) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('status', textstatus);
  }
}
