import 'package:db_project/pages/register_page.dart';
import 'package:db_project/pages/splash_screen.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:flutter/cupertino.dart';
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
  EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
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
      ),
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
            TextField(
              onTapOutside: (_) => FocusScope.of(context)
                  .unfocus(), //textfield dışına basınca klavye gitsin diye
              controller: usernameController,
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
            ),
            TextField(
              onTapOutside: (_) => FocusScope.of(context).unfocus(),
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                  suffixIcon: Icon(
                    Icons.visibility_off,
                    color: Colors.grey,
                  ),
                  label: Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  )),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: MediaQuery.of(context).size.width * .15,
                  vertical: 40),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    var response = await DataManager.isValidAccount(
                        usernameController.text, passwordController.text);
                    if (response != null && response >= 0) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SplashScreen(),
                      ));
                    }
                  },
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

  Widget signUpGroup(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Don't have an account?",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const RegisterPage(),
            ));
          },
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
}
