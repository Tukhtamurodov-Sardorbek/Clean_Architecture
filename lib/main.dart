import 'package:flutter/material.dart';
import 'package:flutter_project/flavors/base_config.dart';
import 'package:core/core.dart';

void mainCommon() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        return F.appFlavor == Flavor.prod
            ? const MyApp()
            : SafeArea(
                child: Banner(
                  location: BannerLocation.topStart,
                  message: F.name,
                  color: Colors.black,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14.0,
                    letterSpacing: 1.0,
                  ),
                  child: const MyApp(),
                ),
              );
      },
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
        title: const Text('Clean Architecture'),
      ),
      body: Container(
        color: Colors.blueGrey,
      ),
    );
  }
}
