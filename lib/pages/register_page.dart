import 'package:db_project/models/user.dart';
import 'package:db_project/pages/splash_screen.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  late User newUser;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    newUser = User();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
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
                  newUser.username = usernameController.text;
                  newUser.password = passwordController.text;
                  await DataManager.insertNewUser(newUser);
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const SplashScreen(),
                  ));
                },
                icon: const Icon(Icons.login_rounded),
                label: const Text("Register")),
          ),
        ],
      ),
    );
  }
}
