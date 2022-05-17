import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/auth.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
    required this.user,
  }) : super(key: key);

  final User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyTimeTrade'),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
                radius: 30,
                backgroundImage: (user.photoURL == null)
                    ? const AssetImage("assets/img/blank-profile-picture.png")
                        as ImageProvider
                    : NetworkImage(user.photoURL!)),
            const SizedBox(height: 10),
            Text(
              user.displayName!,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              user.email!,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            const SignOutButton(),
          ],
        ),
      ),
    );
  }
}
