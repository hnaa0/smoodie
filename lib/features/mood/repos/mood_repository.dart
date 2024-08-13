import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoodie/features/mood/models/mood_model.dart';
import 'package:smoodie/features/mood/models/mood_type.dart';

class MoodRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> uploadMood({
    required String title,
    required String content,
    required MoodType moodType,
    required String uid,
  }) async {
    final mood = {
      "title": title,
      "content": content,
      "moodType": moodType.name,
      "userId": uid,
      "createdAt": FieldValue.serverTimestamp(),
    };
    final docRef = await _firestore.collection("moods").add(mood);
    final docId = docRef.id;

    await _firestore.collection("moods").doc(docId).update({"id": docId});
  }

  Stream<List<MoodModel>> streamMoods(String userId) {
    return _firestore
        .collection("moods")
        .where("userId", isEqualTo: userId)
        .orderBy("createdAt", descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => MoodModel.fromJson(json: doc.data()))
            .toList());
  }

  Future<List<MapEntry<MoodType, int>>> getFrequentlyMood(String userId) async {
    DateTime now = DateTime.now();
    DateTime oneMonthAgo = now.subtract(const Duration(days: 30));
    final Map<MoodType, int> frequencies = {};

    // 1달간 작성된 모든 mood 가져오기
    final snapshot = await _firestore
        .collection("moods")
        .where("userId", isEqualTo: userId)
        .where("createdAt",
            isGreaterThanOrEqualTo: Timestamp.fromDate(oneMonthAgo))
        .orderBy("createdAt", descending: true)
        .get();

    final getAllMoods = snapshot.docs
        .map((doc) => MoodModel.fromJson(json: doc.data()))
        .toList();

    // 타입별 빈도 계산
    final moodTypes = getAllMoods.map((mood) => mood.moodType).toList();

    for (var mood in moodTypes) {
      frequencies[mood] = (frequencies[mood] ?? 0) + 1;
    }

    final sorted = frequencies.entries.toList();
    sorted.sort(
      (a, b) => b.value.compareTo(a.value),
    );

    // 상위 3개 추려내기
    final top3 = sorted.take(3).toList();
    return top3;
  }

  Future<void> deleteMood(String id) async {
    await _firestore.collection("moods").doc(id).delete();
  }
}

final moodRepo = Provider((ref) => MoodRepository());
