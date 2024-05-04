import 'package:async_builder/async_builder.dart';
import 'package:db_project/pages/main_page.dart';
import 'package:db_project/utils/providers/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  DataProvider? dataProvider;

  Future<void> loadData() async {
    await dataProvider!.init();
  }

  @override
  Widget build(BuildContext context) {
    dataProvider = Provider.of<DataProvider>(context);

    return AsyncBuilder(
      waiting: (context) => const CircularProgressIndicator(),
      builder: (context, snapshot) => const MainPage(),
      future: loadData(),
    );
  }
}
