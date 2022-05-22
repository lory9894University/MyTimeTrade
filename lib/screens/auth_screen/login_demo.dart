import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mytimetrade/firebase/auth_operations.dart';

import '../../firebase/firebase_options.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  /*Future<FirebaseApp> initializeFirebase() async {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      await Future.delayed(const Duration(milliseconds: 500));
      if (mounted) { //TODO: Commentato solo per vedere le modifiche nelle altre UI
        Navigator.pushReplacementNamed(context, '/welcome', arguments: user);
      }
    }
    return firebaseApp;
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: FutureBuilder(
          //future: initializeFirebase(),
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
                      decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Email',
                          hintText: 'Enter valid email id as abc@gmail.com'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 15, bottom: 0),
                    //padding: EdgeInsets.symmetric(horizontal: 15),
                    child: TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText: 'Password',
                          hintText: 'Enter secure password'),
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
                        User? user = await AuthOperation.signInUsingEmailPassword(
                            email: emailController.text,
                            password: passwordController.text,
                            context:
                                context); // ritorna null se l'autenticazione non è riuscita
                        if (user != null) {
                          await Future.delayed(
                              const Duration(milliseconds: 500));
                          if (mounted) {
                            Navigator.pushReplacementNamed(context, '/welcome',
                                arguments: user);
                          }
                        } else {
                          //TODO: implementare qualche errore di password errata/ email non esistente
                        }
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
                        } else {
                          //TODO: implementare qualche errore di password errata/ email non esistente
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
