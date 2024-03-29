import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/screens/home.dart';
import 'package:flutterapp/screens/list_product.dart';
import 'package:flutterapp/screens/show_map.dart';

class MyService extends StatefulWidget {
  @override
  _MyServiceState createState() => _MyServiceState();
}

class _MyServiceState extends State<MyService> {
  // Explicite
  String loginString = '';
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  double myIconSize = 36.0;
  double h2 = 18.0;
  Widget myWidget = ListProduct();

  // Method

  @override
  void initState() {
    super.initState();
    findDisplayName();
  }

  Widget listProductMenu() {
    return ListTile(
      leading: Icon(
        Icons.home,
        size: myIconSize,
      ),
      title: Text(
        'List Product',
        style: TextStyle(fontSize: h2),
      ),
      subtitle: Text('Show list all Product'),
      onTap: () {
        setState(() {
          myWidget = ListProduct();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget mapMenu() {
    return ListTile(
      leading: Icon(
        Icons.map,
        size: myIconSize,
      ),
      title: Text(
        'Show MAP',
        style: TextStyle(fontSize: h2),
      ),
      subtitle: Text('Show Current Location Map'),
      onTap: () {
        setState(() {
          myWidget = ShowMap();
          Navigator.of(context).pop();
        });
      },
    );
  }

  Widget signOutMenu() {
    return ListTile(
      leading: Icon(
        Icons.cached,
        size: myIconSize,
      ),
      title: Text('Sign Out'),
      onTap: () {
        processSignOut();
      },
    );
  }

  Future<void> processSignOut() async {
    await firebaseAuth.signOut().then((reponse) {
      MaterialPageRoute materialPageRoute =
          MaterialPageRoute(builder: (BuildContext context) => Home());
      Navigator.of(context).pushAndRemoveUntil(
          materialPageRoute, (Route<dynamic> route) => false);
    });
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
        children: <Widget>[
          myHeadDrawer(),
          listProductMenu(),
          mapMenu(),
          signOutMenu()
        ],
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
