import 'package:flutter/material.dart';
import 'package:screl_test/controller/login_storage.dart';
import 'package:screl_test/view/login_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: TextButton(
              onPressed: () {
                setState(() {
                  LoginStorage.deleteAccount();
                });
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginPage(),
                    ));
              },
              child: const Text('Sign out'))),
    );
  }
}
