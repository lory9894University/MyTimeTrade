import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/firebase/auth_operations.dart';

class RegistrationPage extends StatefulWidget {
  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  bool _validPassword = true;
  bool _validEmail = true;
  bool _validUsername = true;
  String _passwordError = 'Password is required';
  String _emailError = 'Email is required';

  //validate password
  bool validatePassword(String value) {
    bool valid = false;
    RegExp regex = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
    if (value.isEmpty) {
      _passwordError = 'Password is required';
    } else if (!regex.hasMatch(value)) {
      _passwordError =
          "Password must contain an upper case letter and a number";
    } else {
      _validPassword = true;
      return true;
    }
    setState(() => {});
    _validPassword = false;
    return false;
  }

  //validate email
  validateEmail(String value) {
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (value.isEmpty) {
      _emailError = 'Email is required';
    } else if (!regex.hasMatch(value)) {
      _emailError = 'Invalid email';
    } else {
      _validEmail = true;
      print("valid email");
      return true;
    }
    print("invalid email");

    setState(() => {});
    _validEmail = false;
    return false;
  }

  bool validateForm() {
    validateEmail(emailController.text);
    validatePassword(passwordController.text);
    if (usernameController.text.isEmpty) {
      _validUsername = false;
    } else {
      _validUsername = true;
    }
    return _validEmail && _validPassword && _validUsername;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        const TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Registration Page"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 130,
            ),
            Padding(
              //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Enter valid email as abc@gmail.com',
                    errorText: _validEmail ? null : _emailError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter creative username',
                    errorText: _validUsername ? null : 'Username is required'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter secure password',
                    errorText: _validPassword ? null : _passwordError),
              ),
            ),
            const SizedBox(
              height: 70,
            ),
            Container(
              height: 50,
              width: 250,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(20)),
              child: TextButton(
                onPressed: () async {
                  if (validateForm()) {
                    User? user = await AuthOperation.registerUserAndSignIn(
                        emailController.text, passwordController.text);
                    DatabaseReference ref = FirebaseDatabase.instance
                        .ref()
                        .child("users/${user?.uid}");
                    await ref.set({
                      "name": usernameController.text,
                      "balance": 0,
                      "transactions": [],
                      "referral": user?.uid.substring(0, 5)
                    });
                    if (user != null) {
                      Navigator.pushReplacementNamed(context, '/',
                          arguments: user);
                    }
                  }
                },
                child: const Text(
                  'Send',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
            const SizedBox(
              height: 130,
            ),
          ],
        ),
      ),
    );
  }
}
