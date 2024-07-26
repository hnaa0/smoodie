import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/view_models/upload_mood_view_model.dart';

class PostButton extends ConsumerWidget {
  const PostButton({
    super.key,
    required this.onPostTap,
  });

  final Function onPostTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onPostTap(),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 56,
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 16,
        ),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(SmoodieColors.coralPink),
              Color(SmoodieColors.atomicTangerine),
              Color(SmoodieColors.apricot),
            ],
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(28),
          ),
        ),
        child: ref.watch(uploadMoodProvider).isLoading
            ? LoadingAnimationWidget.bouncingBall(
                color: Colors.white,
                size: 20,
              )
            : const Text(
                "Post",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
