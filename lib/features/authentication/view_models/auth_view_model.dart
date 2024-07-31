import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smoodie/features/analysis/view_models/analysis_view_model.dart';
import 'package:smoodie/features/authentication/repos/auth_repository.dart';
import 'package:smoodie/features/mood/view_models/fetch_mood_view_model.dart';
import 'package:smoodie/features/mood/views/home_screen.dart';
import 'package:smoodie/features/user/view_models/user_view_model.dart';

class AuthViewModel extends AsyncNotifier<void> {
  late final AuthRepository _authRepository;

  @override
  FutureOr<void> build() {
    _authRepository = ref.read(authRepo);
  }

  Future<void> signIn({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    state = await AsyncValue.guard(() async {
      await _authRepository.signInWithEmail(
        email: email,
        password: password,
      );
    });

    if (state.hasError) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text((state.error as FirebaseException).message ??
              "something went wrong :("),
        ),
      );
    } else {
      if (!context.mounted) return;
      context.go(HomeScreen.routeUrl);
    }
  }

  Future<void> signUp({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    state = const AsyncValue.loading();

    final user = ref.read(userProvider.notifier);

    state = await AsyncValue.guard(() async {
      final userCredential = await _authRepository.signUpWithEmail(
        email: email,
        password: password,
      );

      await user.createProfile(
        userCredential: userCredential,
        name: name,
        email: email,
        password: password,
      );
    });

    if (state.hasError) {
      if (!context.mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text((state.error as FirebaseException).message ??
              "something went wrong :("),
        ),
      );
    } else {
      if (!context.mounted) return;
      context.go(HomeScreen.routeUrl);
    }
  }

  Future<void> signOut() async {
    state = await AsyncValue.guard(() async {
      await _authRepository.signOut();
    });

    ref.invalidate(userProvider);
    ref.invalidate(fetchMoodProvider);
    ref.invalidate(analysisProvider);
  }
}

final authProvider =
    AsyncNotifierProvider<AuthViewModel, void>(() => AuthViewModel());
