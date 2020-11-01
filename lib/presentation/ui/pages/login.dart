import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:marketing_questions/presentation/ui/pages/home.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  static const routeName = '/';
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("login"),
              onPressed: () async {
                try {
                  UserCredential userCredential = await FirebaseAuth.instance
                      .createUserWithEmailAndPassword(
                          email: "barry.allen@example.com",
                          password: "SuperSecretPassword!");
                  print(userCredential);
                  Navigator.of(context).pushNamed(HomePage.routeName);
                } on Error {
                  print("error");
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
