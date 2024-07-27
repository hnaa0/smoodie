import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoodie/features/authentication/repos/auth_repository.dart';
import 'package:smoodie/features/mood/models/mood_type.dart';
import 'package:smoodie/features/mood/repos/mood_repository.dart';

class AnalysisViewModel extends AsyncNotifier<List<MapEntry<MoodType, int>>> {
  late final MoodRepository _moodRepository;
  late final AuthRepository _authRepository;

  @override
  Future<List<MapEntry<MoodType, int>>> build() async {
    _moodRepository = ref.read(moodRepo);
    _authRepository = ref.read(authRepo);

    if (_authRepository.isLoggedIn) {
      final uid = _authRepository.user!.uid;
      final types = await getFrequencies(uid);

      return types;
    }

    return [];
  }

  Future<List<MapEntry<MoodType, int>>> getFrequencies(String userUid) async {
    state = const AsyncValue.loading();

    final user = _authRepository.user!;
    final types = await _moodRepository.getFrequentlyMood(user.uid);

    state = AsyncValue.data(types);
    return types;
  }
}

final analysisProvider =
    AsyncNotifierProvider<AnalysisViewModel, List<MapEntry<MoodType, int>>>(
        () => AnalysisViewModel());
