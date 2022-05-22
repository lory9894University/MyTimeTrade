import 'package:flutter/material.dart';
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
      initialRoute: '/welcome',
      routes: {
        '/': (context) => LoginPage(),
        '/registration': (context) => RegistrationPage(),
        '/welcome': (context) => HomePage(),
        '/profile': (context) => Profile(),
      },
    );
  }
}