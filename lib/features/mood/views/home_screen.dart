import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/views/widgets/home_sliver_app_bar.dart';
import 'package:smoodie/features/mood/views/widgets/mood_card.dart';

class HomeScreen extends StatefulWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        controller: _scrollController,
        slivers: [
          const HomeSliverAppBar(),
          const SliverGap(10),
          SliverPadding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            sliver: SliverList.separated(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const MoodCard();
              },
              separatorBuilder: (context, index) => const Divider(
                color: Color(
                  SmoodieColors.gray_200,
                ),
              ),
            ),
          ),
          const SliverGap(40),
        ],
      ),
    );
  }
}
