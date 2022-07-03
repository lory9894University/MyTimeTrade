import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class forgotPassword extends StatefulWidget {
  @override
  _forgotPasswordState createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {
  TextEditingController emailController = TextEditingController();
  bool _validEmail = true;
  String _emailError = 'Email is required';

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

    _validEmail = false;
    return false;
  }

  @override
  Widget build(BuildContext context) {
    TextStyle defaultStyle =
        const TextStyle(color: Colors.grey, fontSize: 20.0);
    TextStyle linkStyle = const TextStyle(color: Colors.blue);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Recupero password"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 130,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Inserisci la tua mail',
                    errorText: _validEmail ? null : _emailError),
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
                  bool error = false;
                  if (validateEmail(emailController.text)) {
                    try {
                      await FirebaseAuth.instance
                          .sendPasswordResetEmail(email: emailController.text);
                    } on FirebaseAuthException catch (e) {
                      print(e.code);
                      error = true;
                    }
                    if (!error) {
                      Navigator.pushReplacementNamed(context, '/');
                    } else {
                      if (mounted) {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                                content: Text(
                          'Utente non registrato',
                          textAlign: TextAlign.center,
                        )));
                      }
                    }
                  } else {
                    setState(() => {});
                  }
                },
                child: const Text(
                  'Recupera',
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}