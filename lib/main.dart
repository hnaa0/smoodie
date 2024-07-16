import 'package:flutter/material.dart';
import 'package:smoodie/router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Smoodie",
      routerConfig: router,
      theme: ThemeData(),
    );
  }
}
