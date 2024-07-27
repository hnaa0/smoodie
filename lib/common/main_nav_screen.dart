import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/analysis/views/analysis_screen.dart';
import 'package:smoodie/features/mood/views/home_screen.dart';
import 'package:smoodie/features/mood/views/write_screen.dart';
import 'package:smoodie/features/settings/views/settings_screen.dart';
import 'package:smoodie/features/user/views/profile_screen.dart';

class MainNavScreen extends StatefulWidget {
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
  State<MainNavScreen> createState() => _MainNavScreenState();
}

class _MainNavScreenState extends State<MainNavScreen> {
  late int _selectedIndex = MainNavScreen.tabs.indexOf(widget.tab);

  void _onNavTap(int idx) {
    setState(() {
      _selectedIndex = idx;
    });

    context.go("/${MainNavScreen.tabs[idx]}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          Offstage(
            offstage: _selectedIndex != 0,
            child: const HomeScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 1,
            child: AnalysisScreen(selectedIndex: _selectedIndex),
          ),
          Offstage(
            offstage: _selectedIndex != 2,
            child: const WriteScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 3,
            child: const ProfileScreen(),
          ),
          Offstage(
            offstage: _selectedIndex != 4,
            child: const SettingsScreen(),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color(SmoodieColors.apricot),
        backgroundColor: Colors.white,
        buttonBackgroundColor: const Color(SmoodieColors.atomicTangerine),
        onTap: (value) => _onNavTap(value),
        items: [
          Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              "assets/icons/home.svg",
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              "assets/icons/stats.svg",
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              "assets/icons/pencil.svg",
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              "assets/icons/user.svg",
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4),
            child: SvgPicture.asset(
              "assets/icons/settings.svg",
              width: 24,
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
