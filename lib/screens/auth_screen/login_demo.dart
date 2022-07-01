import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/firebase/auth_operations.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late Verificator validator = Verificator(emailController, passwordController);

  initializeFirebase() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) {
        Navigator.pushReplacementNamed(context, '/welcome', arguments: user);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
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
                      child: Container(
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
                          hintText: 'Enter email as abc@gmail.com',
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
                          hintText: 'Enter password',
                          errorText: validator._validPassword
                              ? null
                              : "Password is required"),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      //TODO FORGOT PASSWORD SCREEN GOES HERE
                    },
                    child: const Text(
                      'Forgot Password',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
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
                          User? user = await AuthOperation.signInUsingEmailPassword(
                              email: emailController.text,
                              password: passwordController.text,
                              context:
                                  context); // ritorna null se l'autenticazione non è riuscita
                          if (user != null) {
                            await Future.delayed(
                                const Duration(milliseconds: 500));
                            if (mounted) {
                              Navigator.pushReplacementNamed(
                                  context, '/welcome',
                                  arguments: user);
                            }
                          } else {
                            if (mounted) {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                      content: Text(
                                'wrong username or password',
                                textAlign: TextAlign.center,
                              )));
                            }
                          }
                        }
                        setState(() => {});
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  Container(
                    height: 50,
                    width: 250,
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(20)),
                    child: TextButton(
                      onPressed: () async {
                        User? user = await AuthOperation.signInWithGoogle();
                        if (user != null) {
                          await Future.delayed(
                              const Duration(milliseconds: 500));
                          if (mounted) {
                            Navigator.pushReplacementNamed(context, '/welcome',
                                arguments: user);
                          }
                        }
                      },
                      child: const Text(
                        'Login with google',
                        style: TextStyle(color: Colors.white, fontSize: 25),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 130,
                  ),
                  const Text('Non ti sei ancora registrato?'),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/registration');
                    },
                    child: const Text(
                      'Clicca qui, per farlo ora!',
                      style: TextStyle(color: Colors.blue, fontSize: 15),
                    ),
                  ),
                ],
              ),
            );

            return const Center(
              child: CircularProgressIndicator(),
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
  String _emailError = 'Email is required';

  Verificator(TextEditingController this.emailController,
      TextEditingController this.passwordController);

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
      _emailError = 'Email is required';
    } else if (!regex.hasMatch(value)) {
      _emailError = 'Invalid email';
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
