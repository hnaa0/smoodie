import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/views/models/mood_type.dart';

class MoodTag extends StatelessWidget {
  const MoodTag({
    super.key,
    required this.mood,
    required this.index,
    required this.selectedIdx,
  });

  final MoodType mood;
  final int index;
  final int selectedIdx;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(
        milliseconds: 100,
      ),
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: selectedIdx == index
            ? Border.all(
                color: const Color(
                  SmoodieColors.gray_100,
                ),
                width: 1,
              )
            : null,
        color: Color(mood.color),
      ),
      child: selectedIdx == index
          ? Container(
              alignment: Alignment.center,
              width: 20,
              height: 20,
              child: SvgPicture.asset(
                "assets/icons/check.svg",
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
              ),
            )
          : null,
    );
  }
}
