import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smoodie/features/user/models/user_model.dart';

class UserRepository {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> createProfile(UserModel profile) async {
    await _firestore.collection("users").doc(profile.uid).set(profile.toJson());
  }

  Future<Map<String, dynamic>?> getProfile(String uid) async {
    final doc = await _firestore.collection("users").doc(uid).get();
    return doc.data();
  }

  Future<void> updateProfile(String uid, Map<String, dynamic> data) async {
    await _firestore.collection("users").doc(uid).update(data);
  }
}

final userRepo = Provider((ref) => UserRepository());
