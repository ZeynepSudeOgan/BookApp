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
      body: Stack(children: [
        Container(
          child: const Padding(
            padding: EdgeInsets.only(top: 60.0, left: 22),
            child: Text(
              "Hello\nLog in",
              style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 200),
          child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40), topRight: Radius.circular(40)),
              color: Colors.white,
            ),
            height: double.infinity,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.only(left: 18, right: 18),
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
                          "User Name",
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
                  const SizedBox(height: 40),
                  SizedBox(
                    height: 55,
                    width: 300,
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
                  const SizedBox(height: 80),
                  const Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Don't have an account?",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.only(left: 273),
                    child: SizedBox(
                      height: 40,
                      width: 200,
                      child: ElevatedButton(
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
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ),



                ],
              ),
            ),
          ),
        ),
      ]),
);
}
}
