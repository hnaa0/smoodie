import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:smoodie/features/mood/models/mood_type.dart';

class MoodModel {
  final String id;
  final String title;
  final String content;
  final String userId;
  final Timestamp createdAt;
  final MoodType moodType;

  MoodModel({
    this.id = "",
    required this.title,
    required this.content,
    required this.userId,
    required this.createdAt,
    required this.moodType,
  });

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "title": title,
      "content": content,
      "userId": userId,
      "createdAt": createdAt,
      "moodType": moodType.name,
    };
  }

  MoodModel.fromJson({required Map<String, dynamic> json})
      : id = json["id"] ?? "",
        title = json["title"],
        content = json["content"],
        userId = json["userId"],
        createdAt = json["createdAt"] ?? Timestamp.now(),
        moodType = MoodTypeExtension.fromString(
          json["moodType"],
        );

  String convertDate() {
    final createdAt = this.createdAt.toDate();
    return DateFormat('yyyy-MM-dd').add_jm().format(createdAt);
  }
}
