import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterfire_ui/i10n.dart';
import 'package:localization/localization.dart';
import 'package:mytimetrade/screens/auth_screen/forgot_password.dart';
import 'package:mytimetrade/screens/personal_profile.dart';

import 'firebase/firebase_options.dart';
import 'screens/accetta.dart';
import 'screens/auth_screen/login_demo.dart';
import 'screens/auth_screen/registration_page.dart';
import 'screens/home_page.dart';
import 'screens/inserimento_ore.dart';
import 'screens/invita_amici.dart';
import 'screens/profile.dart';
import 'screens/servizi_elenco.dart';
import 'screens/swipe.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseDatabase.instance.setPersistenceEnabled(true);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((value) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    LocalJsonLocalization.delegate.directories = ['assets/i18n'];

    return MaterialApp(
      supportedLocales: const [
        Locale("en", "US"),
        Locale("it", "IT"),
        Locale("ja", "JP"),
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        if (supportedLocales.contains(locale)) {
          return locale;
        }

        // define pt_BR as default when de language code is 'pt'
        if (locale?.languageCode == 'en') {
          return const Locale('en', 'US');
        }

        // default language
        return const Locale('en', 'US');
      },
      localizationsDelegates: [
        // delegate from flutter_localization
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        // delegate from localization package.
        LocalJsonLocalization.delegate,
      ],
      title: 'MyTimeTrade',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/registration': (context) => const RegistrationPage(),
        '/lostpw': (context) => const ForgotPassword(),
        '/welcome': (context) => const HomePage(),
        '/profile': (context) => const Profile(),
        '/pers_profile': (context) => const PersonalProfile(),
        '/ore': (context) => const Ore(),
        '/servizi': (context) => const ServiziElenco(),
        '/amici': (context) => const InvitaAmici(),
        '/accetta': (context) => const Accetta(),
        '/swipe': (context) => const Swipe(),
      },
    );
  }
}
