import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/authentication/view_models/auth_view_model.dart';

class AuthButton extends ConsumerWidget {
  const AuthButton({
    super.key,
    required this.buttonText,
    required this.onButtonTap,
  });

  final String buttonText;
  final Function onButtonTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => onButtonTap(),
      child: Container(
        constraints: const BoxConstraints(
          minHeight: 51,
        ),
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(
          horizontal: 18,
          vertical: 14,
        ),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          gradient: const LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            colors: [
              Color(SmoodieColors.coralPink),
              Color(SmoodieColors.apricot),
              Color(SmoodieColors.vanilla),
              Color(SmoodieColors.teaGreen),
            ],
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(SmoodieColors.gray_300),
              blurRadius: 2,
              spreadRadius: 0.1,
              offset: Offset.zero,
            ),
          ],
        ),
        child: ref.watch(authProvider).isLoading
            ? LoadingAnimationWidget.bouncingBall(
                color: Colors.white,
                size: 20,
              )
            : Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.w800,
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
      ),
    );
  }
}
