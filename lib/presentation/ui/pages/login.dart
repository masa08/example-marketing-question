import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:marketing_questions/presentation/ui/pages/home.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key key}) : super(key: key);

  static const routeName = '/';
  auth.FirebaseAuth _auth = auth.FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Platform.isIOS ? 'iOS Device Info' : 'Android Device Info'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("login"),
              onPressed: () async {
                try {
                  auth.UserCredential userCredential =
                      await _auth.createUserWithEmailAndPassword(
                          email: "barry.allen@example.com",
                          password: "SuperSecretPassword!");
                  print(userCredential);
                  Navigator.of(context).pushNamed(HomePage.routeName);
                } on Error {
                  print("error");
                }
              },
            ),
            if (Platform.isIOS)
              RaisedButton(
                child: Text("Sign in Apple"),
                onPressed: () async {
                  try {
                    final appleIdCredential =
                        await SignInWithApple.getAppleIDCredential(
                      scopes: [
                        AppleIDAuthorizationScopes.email,
                        AppleIDAuthorizationScopes.fullName,
                      ],
                    );
                    final oAuthProvider = auth.OAuthProvider('apple.com');
                    final credential = oAuthProvider.credential(
                      idToken: appleIdCredential.identityToken,
                      accessToken: appleIdCredential.authorizationCode,
                    );
                    await _auth.signInWithCredential(credential);

                    // TODO: 取得したユーザー情報をriverpodで管理

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
