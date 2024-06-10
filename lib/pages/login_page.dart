import 'package:db_project/pages/register_page.dart';
import 'package:db_project/pages/splash_screen.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:db_project/utils/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: horizontalPadding,
              child: const Text(
                "Hello\nLog in",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: mainWidget(context),
        ),
      ]),
    );
  }

  Widget mainWidget(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
        color: Colors.white,
      ),
      child: Padding(
        padding: horizontalPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            usernameField(context),
            passwordField(context),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .15,
                  vertical: 40),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async => await login(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                  child: const Text(
                    "Log in",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerRight,
              child: signUpGroup(context),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> login(BuildContext context) async {
    var response = await DataManager.login(
        usernameController.text, passwordController.text);
    if (response != null) {
      Provider.of<UserProvider>(context, listen: false).setUser(response);

      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const SplashScreen(),
      ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Invalid username or password"),
      ));
    }
  }

  TextField usernameField(BuildContext context) {
    return TextField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: usernameController,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.check,
            color: Colors.grey,
          ),
          label: Text(
            "Username",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
    );
  }

  bool obscurePassword = true;
  TextField passwordField(BuildContext context) {
    return TextField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      style: const TextStyle(color: Colors.black),
      controller: passwordController,
      obscureText: obscurePassword,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscurePassword = !obscurePassword;
              });
            },
            icon: Icon(
              obscurePassword ? Icons.visibility : Icons.visibility_off,
              color: Colors.grey,
            ),
          ),
          label: const Text(
            "Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
    );
  }

  Widget signUpGroup(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        ElevatedButton(
          onPressed: onSignUpClicked,
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black87,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
          ),
          child: const Text(
            "Sign Up",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 13, color: Colors.white),
          ),
        ),
      ],
    );
  }

  void onSignUpClicked() {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const RegisterPage(),
    ));
  }
}
