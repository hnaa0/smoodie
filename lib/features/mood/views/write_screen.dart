import 'package:flutter/material.dart';

class WriteScreen extends StatelessWidget {
  static const routeUrl = "/write";
  static const routeName = "write";

  const WriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Text("write"),
    );
  }
}
