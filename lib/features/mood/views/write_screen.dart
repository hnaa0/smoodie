import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/views/models/mood_type.dart';
import 'package:smoodie/features/mood/views/widgets/mood_tag.dart';
import 'package:smoodie/features/mood/views/widgets/write_field.dart';

enum WriteFieldType {
  title,
  content,
}

class WriteScreen extends StatefulWidget {
  static const routeUrl = "/write";
  static const routeName = "write";

  const WriteScreen({super.key});

  @override
  State<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  int _selectedIdx = 0;

  void onMoodTap({required String mood, required int index}) {
    setState(() {
      _selectedIdx = index;
      // _formData["moodType"] = MoodTypeExtension.fromString(mood);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 56,
                child: const Text(
                  "Add Mood",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ),
              const Gap(20),
              const Padding(
                padding: EdgeInsets.only(
                  left: 4,
                ),
                child: Text(
                  "MOOD COLOR",
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Color(SmoodieColors.coralPink),
                  ),
                ),
              ),
              const Gap(8),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(28),
                  ),
                ),
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: MoodType.values.length,
                  itemBuilder: (context, index) {
                    var mood = MoodType.values[index];
                    return GestureDetector(
                      onTap: () {
                        onMoodTap(mood: mood.name, index: index);
                      },
                      child: MoodTag(
                        mood: mood,
                        index: index,
                        selectedIdx: _selectedIdx,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => const Gap(8),
                ),
              ),
              const Gap(14),
              const Divider(
                color: Color(SmoodieColors.apricot),
              ),
              const Gap(14),
              const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Form(
                  child: Column(
                    children: [
                      WriteField(
                        type: WriteFieldType.title,
                      ),
                      Gap(22),
                      SingleChildScrollView(
                        child: WriteField(
                          type: WriteFieldType.content,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
