import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/models/mood_model.dart';

class MoodCard extends StatelessWidget {
  const MoodCard({
    super.key,
    required this.mood,
  });

  final MoodModel mood;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(mood.moodType.color),
              shape: BoxShape.circle,
            ),
          ),
          const Gap(20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mood.title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Gap(8),
                Text(
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  mood.content,
                  style: const TextStyle(
                    color: Color(
                      SmoodieColors.gray_700,
                    ),
                  ),
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      mood.convertDate(),
                      style: const TextStyle(
                        fontSize: 12,
                        color: Color(
                          SmoodieColors.gray_400,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
