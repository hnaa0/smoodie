import 'package:flutter/material.dart';
import 'package:smoodie/constants/colors.dart';

class HomeSliverAppBar extends StatelessWidget {
  const HomeSliverAppBar({super.key, required this.scrollTop});

  final Function scrollTop;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: GestureDetector(
          onTap: () => scrollTop(),
          child: const Text(
            "SMOODIE",
            style: TextStyle(
              fontFamily: "InooAriDuri",
              fontSize: 32,
            ),
          ),
        ),
        titlePadding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 12,
        ),
        background: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(SmoodieColors.coralPink),
                Color(SmoodieColors.apricot),
                Color(SmoodieColors.vanilla),
                Color(SmoodieColors.teaGreen),
              ],
            ),
          ),
        ),
      ),
      // centerTitle: true,
      floating: true,
      toolbarHeight: 160,
    );
  }
}
