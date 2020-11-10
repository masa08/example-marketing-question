import 'package:flutter/material.dart';

class CommentaryPage extends StatelessWidget {
  CommentaryPage({Key key}) : super(key: key);

  static const routeName = '/commentary';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("COMMENTARY PAGE(解説)"),
      ),
      body: Center(
        child: Text('commentary'),
      ),
    );
  }
}
