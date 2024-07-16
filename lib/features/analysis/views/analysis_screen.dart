import 'package:flutter/material.dart';

class AnalysisScreen extends StatelessWidget {
  static const routeUrl = "/analysis";
  static const routeName = "analysis";

  const AnalysisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Text("analysis"),
    );
  }
}
