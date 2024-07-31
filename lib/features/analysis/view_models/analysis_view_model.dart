import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoodie/features/authentication/repos/auth_repository.dart';
import 'package:smoodie/features/mood/models/mood_type.dart';
import 'package:smoodie/features/mood/repos/mood_repository.dart';

class AnalysisViewModel extends AsyncNotifier<List<MapEntry<MoodType, int>>> {
  @override
  Future<List<MapEntry<MoodType, int>>> build() async {
    final authRepository = ref.read(authRepo);
    final moodRepository = ref.read(moodRepo);

    if (authRepository.isLoggedIn) {
      final uid = authRepository.user?.uid;
      if (uid != null) {
        return await getFrequencies(uid, moodRepository);
      }
    }
    return [];
  }

  Future<List<MapEntry<MoodType, int>>> getFrequencies(
      String userUid, MoodRepository moodRepository) async {
    state = const AsyncValue.loading();

    final types = await moodRepository.getFrequentlyMood(userUid);

    state = AsyncValue.data(types);
    return types;
  }
}

final analysisProvider =
    AsyncNotifierProvider<AnalysisViewModel, List<MapEntry<MoodType, int>>>(
        () => AnalysisViewModel());
