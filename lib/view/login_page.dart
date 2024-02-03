import 'package:flutter/material.dart';
import 'package:screl_test/controller/login_storage.dart';
import 'package:screl_test/view/home_page.dart';
import 'package:screl_test/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController userNameController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Login'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldWidget(
                  controller: userNameController,
                  labelText: 'Enter your name',
                ),
                TextFieldWidget(
                  controller: passwordController,
                  labelText: 'Enter your password',
                ),
                ElevatedButton(
                    onPressed: () {
                      if (userNameController.text.trim().isEmpty ||
                          passwordController.text.trim().isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('The input is empty')));
                      } else {
                        setState(() {
                          LoginStorage.setUserName(userNameController.text);
                          LoginStorage.setUserName(passwordController.text);
                        });
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const HomePage(),
                            ));
                      }
                      userNameController.clear();
                    },
                    child: const Text('Login')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
