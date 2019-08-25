import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  //Explicit

  Color nameColor = Colors.green.shade400;
  Color emailColor = Colors.green.shade400;
  Color passwordColor = Colors.green.shade400;
  final formKey = GlobalKey<FormState>();
  String nameString,emailString,passwordString;

  //Method

  Widget nameText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: nameColor,
        ),
        labelText: 'Name : ',
        labelStyle: TextStyle(color: nameColor),
        helperText: 'Type Your Name',
        helperStyle: TextStyle(color: nameColor),
        hintText: 'English Only',
      ),validator: (String value){
        if(value.isEmpty){
          return 'Please fill name is blank';
        }
      },onSaved: (String value){
        nameString = value;
      },
    );
  }

  Widget emailText() {
    return TextFormField(keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: emailColor,
        ),
        labelText: 'Email : ',
        labelStyle: TextStyle(color: emailColor),
        helperText: 'Type Your Email',
        helperStyle: TextStyle(color: emailColor),
        hintText: 'English Only',
      ),validator: (String value){
        if(!((value.contains('@')) && (value.contains('.')))){
          return 'Please type email format';
        }
      },onSaved: (String value){
        emailString = value;
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          size: 36.0,
          color: passwordColor,
        ),
        labelText: 'Password : ',
        labelStyle: TextStyle(color: passwordColor),
        helperText: 'Type Your Password',
        helperStyle: TextStyle(color: passwordColor),
        hintText: 'English Only',
      ),validator: (String value){
        if(value.length < 6){
          return 'Please fill password at lease 6 digit';
        }
      },onSaved: (String value){
        passwordString = value;
      },
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        if(formKey.currentState.validate()){
          formKey.currentState.save();
          print('name = $nameString,email = $emailString,password = $passwordString');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(0xFF, 0xA0, 0x00, 0xb1),
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Form(key:formKey,
        child: ListView(children: <Widget>[
          nameText(),
          emailText(),
          passwordText(),
        ]),
      ),
    );
  }
}
