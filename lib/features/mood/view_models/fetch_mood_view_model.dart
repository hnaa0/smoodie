import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoodie/features/authentication/repos/auth_repository.dart';
import 'package:smoodie/features/mood/models/mood_model.dart';
import 'package:smoodie/features/mood/repos/mood_repository.dart';

class FetchMoodViewModel extends StreamNotifier<List<MoodModel>> {
  @override
  Stream<List<MoodModel>> build() {
    return _fetchMoods();
  }

  Stream<List<MoodModel>> _fetchMoods() {
    final user = ref.read(authRepo).user!;
    final result = ref.read(moodRepo).streamMoods(user.uid);

    return result;
  }
}

final fetchMoodProvider =
    StreamNotifierProvider<FetchMoodViewModel, List<MoodModel>>(
        () => FetchMoodViewModel());
