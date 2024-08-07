import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoodie/features/authentication/repos/auth_repository.dart';
import 'package:smoodie/features/user/models/user_model.dart';
import 'package:smoodie/features/user/repos/user_repository.dart';

class UserViewModel extends AsyncNotifier<UserModel> {
  late final UserRepository _userRepository;
  late final AuthRepository _authRepository;

  @override
  FutureOr<UserModel> build() async {
    _userRepository = ref.read(userRepo);
    _authRepository = ref.read(authRepo);

    if (_authRepository.isLoggedIn) {
      final profile =
          await _userRepository.getProfile(_authRepository.user!.uid);
      if (profile != null) {
        return UserModel.fromJson(profile);
      }
    }

    return UserModel.empty();
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

  Future<UserModel> _getUserProfile(String uid) async {
    state = const AsyncValue.loading();

    final user = ref.read(authRepo).user!;

    state = await AsyncValue.guard(() async {
      final profile = await _userRepository.getProfile(user.uid);

      if (profile != null) {
        return UserModel.fromJson(profile);
      } else {
        return UserModel.empty();
      }
    });
    return UserModel.empty();
  }

  Future<void> onProfileEdit(String name) async {
    state = AsyncValue.data(state.value!.copyWith(name: name));

    await _userRepository.updateProfile(state.value!.uid, {
      "name": name,
    });
  }
}

final userProvider =
    AsyncNotifierProvider<UserViewModel, UserModel>(() => UserViewModel());
