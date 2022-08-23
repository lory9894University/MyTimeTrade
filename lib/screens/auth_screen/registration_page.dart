import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import 'package:mytimetrade/firebase/auth_operations.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController referralController = TextEditingController();
  bool _validPassword = true;
  bool _validEmail = true;
  bool _validUsername = true;
  bool _validReferral = true;
  String _passwordError = 'password required'.i18n();
  String _emailError = 'email required'.i18n();
  String _referralError = 'Il codice amico non esiste'.i18n();

  //validate password
  bool validatePassword(String value) {
    RegExp regex =
        RegExp(r'^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$');
    if (value.isEmpty) {
      _passwordError = 'password required'.i18n();
    } else if (!regex.hasMatch(value)) {
      _passwordError = "password must contain".i18n();
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
      _emailError = 'email required'.i18n();
    } else if (!regex.hasMatch(value)) {
      _emailError = 'invalid email'.i18n();
    } else {
      _validEmail = true;
      return true;
    }

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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("register".i18n()),
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
                    border: const OutlineInputBorder(),
                    labelText: 'Email',
                    hintText: 'Inserisci email'.i18n(),
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
                    border: const OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Inserisci il tuo username'.i18n(),
                    errorText:
                        _validUsername ? null : 'username required'.i18n()),
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
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Inserisci una password valida'.i18n(),
                    errorText: _validPassword ? null : _passwordError),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15, bottom: 0),
              //padding: EdgeInsets.symmetric(horizontal: 15),
              child: TextField(
                controller: referralController,
                obscureText: true,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: 'Codice amico',
                    hintText: 'Se lo hai, inserisci qui il tuo codice amico'.i18n(),
                    errorText: _validReferral ? null : _referralError),
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
                    AuthOperation.registerUserAndSignIn(
                            emailController.text, passwordController.text)
                        .then((user) {
                      DatabaseReference ref = FirebaseDatabase.instance
                          .ref()
                          .child("users/${user?.uid}");
                      ref.set({
                        "name": usernameController.text,
                        "balance": 0,
                        "transactions": [],
                        "referral": user?.uid.substring(0, 5),
                        "phoneNr": "",
                      }).then((value) {
                        if (user != null) {
                          Navigator.pushReplacementNamed(context, '/',
                              arguments: user);
                        }
                      });
                    });
                  }
                },
                child: Text(
                  'register'.i18n(),
                  style: const TextStyle(color: Colors.white, fontSize: 25),
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
