import 'package:db_project/pages/main_page.dart';
import 'package:db_project/pages/splash_screen.dart';
import 'package:db_project/utils/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: DataProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        routes: {
          MainPage.routeName: (context) => const MainPage(),
        },
        home: const SplashScreen(),
      ),
    );
  }
}
