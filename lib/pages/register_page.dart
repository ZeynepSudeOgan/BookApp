// ignore_for_file: use_build_context_synchronously

import 'package:db_project/models/user.dart';
import 'package:db_project/pages/splash_screen.dart';
import 'package:db_project/utils/data_manager.dart';
import 'package:db_project/utils/providers/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 20);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Expanded(
          flex: 3,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: horizontalPadding,
              child: const Text(
                "Hello, \nRegister Bookstore",
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
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: constraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40)),
                  color: Colors.white,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      nameField(context),
                      usernameField(context),
                      passwordField(context),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * .15,
                          vertical: 40,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width,
                          child: ElevatedButton(
                            onPressed: () async => await register(context),
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
                                  fontSize: 20,
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
          ),
        );
      },
    );
  }

  Future<void> register(BuildContext context) async {
    User newUser = User(
      name: nameController.text,
      username: usernameController.text,
      password: passwordController.text,
    );
    var response = await DataManager.register(newUser);
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

  TextField nameField(BuildContext context) {
    return TextField(
      onTapOutside: (_) => FocusScope.of(context).unfocus(),
      controller: nameController,
      style: const TextStyle(color: Colors.black),
      decoration: const InputDecoration(
          suffixIcon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          label: Text(
            "Name",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          )),
    );
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
}
