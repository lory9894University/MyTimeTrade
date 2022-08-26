import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:localization/localization.dart';
import 'package:mytimetrade/firebase/auth_operations.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Verificator validator = Verificator(emailController, passwordController);

  initializeFirebase() async {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user != null) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/welcome', arguments: user);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: FutureBuilder(
          future: initializeFirebase(),
          builder: (context, snapshot) {
            return SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 60.0),
                    child: Center(
                      child: SizedBox(
                          width: 200,
                          height: 150,
                          /*decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50.0)),*/
                          child: Image.asset(
                              'assets/img/handshake.png')), //TODO: Sistemare immagine
                    ),
                  ),
                  Padding(
                    //padding: const EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'enter email'.i18n(),
                          errorText: validator._validEmail
                              ? null
                              : validator._emailError),
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
                          hintText: 'enter password'.i18n(),
                          errorText: validator._validPassword
                              ? null
                              : "password required".i18n()),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/lostpw');
                    },
                    child: Text(
                      'forgot password'.i18n(),
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        if (validator.validate()) {
                          await AuthOperation.signInUsingEmailPassword(
                                  email: emailController.text,
                                  password: passwordController.text,
                                  context: context)
                              .then((user) async {
                            // ritorna null se l'autenticazione non è riuscita
                            if (user != null) {
                              if (mounted) {
                                Navigator.pushReplacementNamed(
                                    context, '/welcome',
                                    arguments: user);
                              }
                            } else {
                              if (mounted) {
                                var connectivityResult =
                                    await Connectivity().checkConnectivity();
                                if (connectivityResult ==
                                    ConnectivityResult.none) {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    'offline login'.i18n(),
                                    textAlign: TextAlign.center,
                                  )));
                                } else {
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(SnackBar(
                                          content: Text(
                                    'wrong username or password'.i18n(),
                                    textAlign: TextAlign.center,
                                  )));
                                }
                              }
                            }
                          });
                        }
                        setState(() => {});
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 15)),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: SignInButton(
                      Buttons.Google,
                      text: "Sign in with Google".i18n(),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      onPressed: () async {
                        AuthOperation.signInWithGoogle().then((user) {
                          if (mounted) {
                            Navigator.pushReplacementNamed(context, '/welcome',
                                arguments: user);
                          }
                        });
                      },
                    ),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 60)),
                  Text('not yet registered?'.i18n()),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: Text(
                      'click here'.i18n(),
                      style: const TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

class Verificator {
  TextEditingController emailController;
  TextEditingController passwordController;
  bool _validPassword = true;
  bool _validEmail = true;
  String _emailError = 'email required'.i18n();

  Verificator(this.emailController, this.passwordController);

  bool validatePassword(String value) {
    if (value.isEmpty) {
      _validPassword = false;
    } else {
      _validPassword = true;
    }
    return _validPassword;
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

    _validEmail = false;
    return false;
  }

  bool validate() {
    validateEmail(emailController.text);
    validatePassword(passwordController.text);

    return _validEmail && _validPassword;
  }
}
