import 'package:flutter/material.dart';
import 'package:smoodie/features/analysis/views/analysis_screen.dart';
import 'package:smoodie/features/mood/views/home_screen.dart';
import 'package:smoodie/features/mood/views/write_screen.dart';
import 'package:smoodie/features/settings/views/settings_screen.dart';
import 'package:smoodie/features/user/views/profile_screen.dart';

class MainNavScreen extends StatelessWidget {
  static const routeName = "main-nav";
  static const tabs = [
    HomeScreen.routeName,
    WriteScreen.routeName,
    AnalysisScreen.routeName,
    ProfileScreen.routeName,
    SettingsScreen.routeName,
  ];

  final String tab;

  const MainNavScreen({
    super.key,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
