import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoodie/features/user/models/user_model.dart';
import 'package:smoodie/features/user/repos/user_repository.dart';

class UserViewModel extends AsyncNotifier<void> {
  late final UserRepository _userRepository;

  @override
  FutureOr<void> build() {
    _userRepository = ref.read(userRepo);
  }

  Future<void> createProfile(
      {required UserCredential userCredential,
      required String name,
      required String email,
      required String password}) async {
    state = const AsyncValue.loading();

    final profile = UserModel(
      name: name,
      email: email,
      uid: userCredential.user!.uid,
    );

    await _userRepository.createProfile(profile);
  }
}

final userProvider =
    AsyncNotifierProvider<UserViewModel, void>(() => UserViewModel());
