import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/models/mood_model.dart';
import 'package:smoodie/features/mood/view_models/fetch_mood_view_model.dart';

class MoodCard extends ConsumerWidget {
  const MoodCard({
    super.key,
    required this.mood,
  });

  final MoodModel mood;

  void _onDeleteMood(String id, BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          elevation: 0,
          title: const Center(
            child: Text(
              "Delete Mood",
            ),
          ),
          content: const Text(
            "Are you sure you want to delete this mood?",
          ),
          actionsPadding: const EdgeInsets.only(
            bottom: 6,
          ),
          actions: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Divider(
                  color: Color(SmoodieColors.gray_200),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    ref.read(fetchMoodProvider.notifier).deleteMood(id);
                    context.pop();
                    FocusScope.of(context).unfocus();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Delete",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const Divider(
                  color: Color(SmoodieColors.gray_200),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () {
                    context.pop();
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: 6,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Cancel",
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 4,
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onLongPress: () => _onDeleteMood(mood.id, context, ref),
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
      ),
    );
  }
}
