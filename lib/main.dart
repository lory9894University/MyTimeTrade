import 'package:flutter/material.dart';
import 'screens/invita_amici.dart';
import 'screens/servizi_elenco.dart';
import 'screens/inserimento_ore.dart';
import 'screens/auth_screen/registration_page.dart';
import 'screens/auth_screen/login_demo.dart';
import 'screens/home_page.dart';
import 'screens/profile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyTimeTrade',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/welcome': (context) => HomePage(),
        '/profile': (context) => Profile(),
        '/ore': (context) => Ore(),
        '/servizi': (context) => ServiziElenco(),
        '/amici': (context) => InvitaAmici(),
      },
    );
  }
}