import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/authentication/repos/auth_repository.dart';
import 'package:smoodie/features/mood/repos/mood_repository.dart';

class UploadMoodViewModel extends AsyncNotifier<void> {
  late final MoodRepository _moodRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _moodRepository = ref.read(moodRepo);
    _authRepository = ref.read(authRepo);
  }

  Future<void> uploadMood(
      {required Map<String, dynamic> form,
      required BuildContext context}) async {
    state = const AsyncValue.loading();

    final user = _authRepository.user!;

    state = await AsyncValue.guard(() async {
      await _moodRepository.uploadMood(
        title: form["title"],
        content: form["content"],
        moodType: form["moodType"],
        uid: user.uid,
      );
    });

    if (!state.hasError) {
      if (!context.mounted) return;
      showCustomAlert(context);
    }
  }
}

final uploadMoodProvider = AsyncNotifierProvider<UploadMoodViewModel, void>(
    () => UploadMoodViewModel());

void showCustomAlert(BuildContext context) {
  final overlay = Overlay.of(context);
  final overlayEntry = OverlayEntry(
    builder: (context) {
      return Positioned(
        top: (MediaQuery.of(context).size.height - 60) * 0.5,
        left: (MediaQuery.of(context).size.width - 60) * 0.5,
        child: Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.all(20),
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: const Color(
              SmoodieColors.teaGreen,
            ),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          child: SvgPicture.asset(
            "assets/icons/check.svg",
            colorFilter: const ColorFilter.mode(
              Colors.white,
              BlendMode.srcIn,
            ),
          ),
        )
            .animate()
            .fadeIn(duration: 200.ms)
            .then(delay: 1800.ms)
            .fadeOut(duration: 200.ms),
      );
    },
  );
  overlay.insert(overlayEntry);
  Future.delayed(2500.ms, () {
    overlayEntry.remove();
  });
}
