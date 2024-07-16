import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const routeUrl = "/profile";
  static const routeName = "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Text("profile"),
    );
  }
}
