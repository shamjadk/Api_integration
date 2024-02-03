import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:screl_test/controller/login_storage.dart';
import 'package:screl_test/view/home_page.dart';
import 'package:screl_test/view/login_page.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: FutureBuilder(
        future: LoginStorage.getuserName(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return const HomePage();
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return const LoginPage();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error'));
          } else {
            return const LoginPage();
          }
        },
      ),
    );
  }
}
