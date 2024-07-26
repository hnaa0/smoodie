import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/models/mood_type.dart';
import 'package:smoodie/features/mood/view_models/upload_mood_view_model.dart';
import 'package:smoodie/features/mood/views/widgets/mood_tag.dart';
import 'package:smoodie/features/mood/views/widgets/post_button.dart';
import 'package:smoodie/features/mood/views/widgets/write_field.dart';

enum WriteFieldType {
  title,
  content,
}

class WriteScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/write";
  static const routeName = "write";

  const WriteScreen({super.key});

  @override
  ConsumerState<WriteScreen> createState() => _WriteScreenState();
}

class _WriteScreenState extends ConsumerState<WriteScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final Map<String, dynamic> _formData = {};

  int _selectedIdx = 0;
  String _title = "";
  String _content = "";
  bool _isInvalid = false;

  void _onMoodTap({required String mood, required int index}) {
    setState(() {
      _selectedIdx = index;
      _formData["moodType"] = MoodTypeExtension.fromString(mood);
    });
  }

  void _onPostTap() {
    if (_content.isEmpty || _title.isEmpty) {
      setState(() {
        _isInvalid = true;
      });
      return;
    }

    if (_formData["moodType"] == null) {
      _formData["moodType"] = MoodType.values[_selectedIdx];
    }

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();

        ref
            .read(uploadMoodProvider.notifier)
            .uploadMood(
              form: _formData,
              context: context,
            )
            .then((value) {
          _initMood();
        });
      }
    }
  }

  void _initMood() {
    setState(() {
      _contentController.clear();
      _titleController.clear();
      _formData.clear();
      _selectedIdx = 0;
      _isInvalid = false;
    });
    FocusScope.of(context).unfocus();
  }

  @override
  void initState() {
    super.initState();
    _titleController.addListener(() {
      setState(() {
        _title = _titleController.text;
      });
    });
    _contentController.addListener(() {
      setState(() {
        _content = _contentController.text;
      });
    });
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    super.dispose();
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 4,
                ),
                child: Row(
                  children: [
                    const Text(
                      "MOOD COLOR",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Color(SmoodieColors.coralPink),
                      ),
                    ),
                    const Gap(8),
                    const SizedBox(
                      height: 14,
                      child: VerticalDivider(
                        color: Color(SmoodieColors.apricot),
                        thickness: 1.5,
                      ),
                    ),
                    const Gap(8),
                    Text(
                      MoodType.values[_selectedIdx].name.toUpperCase(),
                      style: const TextStyle(
                        color: Color(
                          SmoodieColors.gray_500,
                        ),
                      ),
                    ),
                  ],
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
                        _onMoodTap(mood: mood.name, index: index);
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 4,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      WriteField(
                        type: WriteFieldType.title,
                        controller: _titleController,
                        formData: _formData,
                      ),
                      const Gap(22),
                      SingleChildScrollView(
                        child: WriteField(
                          type: WriteFieldType.content,
                          controller: _contentController,
                          formData: _formData,
                        ),
                      ),
                      const Gap(20),
                      PostButton(
                        onPostTap: _onPostTap,
                      ),
                      if (_isInvalid)
                        const Padding(
                          padding: EdgeInsets.only(left: 4, top: 4),
                          child: Text(
                            "제목과 내용은 비워둘 수 없어요! 모두 입력해주세요.",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                      const Gap(20),
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
