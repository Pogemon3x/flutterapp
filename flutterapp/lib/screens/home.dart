import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Explicit

  // Method

  Widget showLogo() {
    return Container(
        alignment: Alignment.center,
        child: Container(
            width: 150.0, height: 150.0, child: Image.asset('images/xyz.png')));
  }

  Widget showAppName() {
    return Text('This is my Home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          showLogo(),
          showAppName(),
        ],
      ),
    );
  }
}
