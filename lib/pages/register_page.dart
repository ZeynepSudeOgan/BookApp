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
        title: const Text(""),
      ),
      body: Stack(
        children: [
          Container(
            child: const Padding(
              padding: EdgeInsets.only(top: 25, left: 22),
              child: Text(
                "Let's Create Your Account",
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(top: 130),
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
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
                        .unfocus(),
                          controller: usernameController,
                          decoration: const InputDecoration(
                              suffixIcon: Icon(
                                Icons.account_circle_rounded,
                                color: Colors.grey,
                              ),
                              label: Text(
                                "Username",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                ),
                              ))),
                      TextField(
                        onTapOutside: (_) => FocusScope.of(context)
                        .unfocus(),
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                            suffixIcon: Icon(
                              Icons.key_rounded,
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
                            newUser.username = usernameController.text;
                            newUser.password = passwordController.text;
                            await DataManager.insertNewUser(newUser);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SplashScreen(),
                            ));
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black87,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            ),
                          ),
                          child: const Text(
                            "Register",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                                color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
