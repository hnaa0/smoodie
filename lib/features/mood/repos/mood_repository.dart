import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
}

final moodRepo = Provider((ref) => MoodRepository());
