import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicite
  String loginString = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // Method

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Future<void> findDisplayName() async {
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    setState(() {
      loginString = firebaseUser.displayName;
    });
  }

  Widget showLogo() {
    return Container(
      width: 80.0,
      height: 80.0,
      child: Image.asset('images/xyz.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'Pogemon',
      style: TextStyle(color: Colors.blue, fontSize: 24.0),
    );
  }

  Widget showLoginName() {
    return Text(
      'Login by ... $loginString',
      style: TextStyle(fontSize: 16.0),
    );
  }

  Widget myHeadDrawer() {
    return DrawerHeader(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/catbg.jpg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: <Widget>[showLogo(), showAppName(), showLoginName()],
      ),
    );
  }

  Widget myDrawerMenu() {
    return Drawer(
      child: ListView(
        children: <Widget>[myHeadDrawer()],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Service'),
        backgroundColor: Colors.blue.shade400,
      ),
      body: Text(
        'Body',
        style: TextStyle(color: Colors.blue, fontSize: 25.0),
      ),
      drawer: myDrawerMenu(),
    );
  }
}
