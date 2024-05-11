import 'package:db_project/pages/register_page.dart';
import 'package:db_project/pages/splash_screen.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(
              controller: usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Username",
                prefixIcon: Icon(Icons.account_circle_rounded),
              )),
          TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Password",
                prefixIcon: Icon(Icons.key_rounded),
              )),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton.icon(
                onPressed: () async {
                  var response = await DataManager.isValidAccount(
                      usernameController.text, passwordController.text);
                  if (response != null && response >= 0) {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const SplashScreen(),
                    ));
                  }
                },
                icon: const Icon(Icons.login_rounded),
                label: const Text("Login")),
          ),
          ElevatedButton.icon(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RegisterPage(),
                ));
              },
              icon: const Icon(Icons.add),
              label: const Text("Sign up"))
        ],
      ),
    );
  }
}
