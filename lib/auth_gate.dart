import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:mytimetrade/home_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        //viene dal firebase_auth package e ci dice se c'è un user logged in o no: se sì, ci da i dati ad esso collegati
        stream: FirebaseAuth.instance
            .authStateChanges(), //ritorna stream di user obj: if null user not logged in
        initialData: FirebaseAuth.instance.currentUser,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return SignInScreen(
              showAuthActionSwitch: true,
              providerConfigs: const [
                EmailProviderConfiguration(),
                GoogleProviderConfiguration(
                    clientId:
                        '1012941757457-q3vpf8m02utetka2gpf351qul92jtgjr.apps.googleusercontent.com')
              ],
              headerBuilder: (context, constraints, _) {
                //TODO: aggiustare immagine
                return const CircleAvatar(
                  radius: 75,
                  backgroundImage: NetworkImage(
                      'https://www.freeiconspng.com/uploads/handshake-icon-21.png'),
                );
              },
            );
          }

          return HomeScreen(user: snapshot.data!);
        });
  }
}
