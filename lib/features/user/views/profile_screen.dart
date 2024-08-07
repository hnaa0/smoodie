import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/user/view_models/user_view_model.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/profile";
  static const routeName = "profile";

  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final TextEditingController _textController = TextEditingController();
  bool _isEditMode = false;

  void _onEditTap() {
    if (_isEditMode) {
      if (_textController.text.length < 2) return;

      ref.read(userProvider.notifier).onProfileEdit(_textController.text);
    }

    setState(() {
      _isEditMode = !_isEditMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(userProvider).when(
          data: (data) {
            _textController.text = data.name;
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: const Text(
                        "Profile",
                        style: TextStyle(
                          fontFamily: "InooAriDuri",
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(SmoodieColors.apricot),
                        ),
                      ),
                    ),
                    const Gap(40),
                    Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: 120,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                            gradient: LinearGradient(
                              begin: Alignment.bottomLeft,
                              end: Alignment.topRight,
                              colors: [
                                Color(SmoodieColors.coralPink),
                                Color(SmoodieColors.apricot),
                                Color(SmoodieColors.vanilla),
                                Color(SmoodieColors.teaGreen),
                              ],
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextField(
                                textAlign: TextAlign.center,
                                readOnly: _isEditMode ? false : true,
                                controller: _textController,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                  fontFamily: "InooAriDuri",
                                ),
                                decoration: const InputDecoration(
                                  filled: false,
                                  isDense: true,
                                  contentPadding: EdgeInsets.zero,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  ),
                                ),
                              ),
                              Text(
                                data.email,
                                style: const TextStyle(
                                  fontSize: 16,
                                  color: Color(SmoodieColors.gray_100),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Positioned(
                          right: 14,
                          top: 14,
                          child: GestureDetector(
                            onTap: _onEditTap,
                            child: SvgPicture.asset(
                              _isEditMode
                                  ? "assets/icons/check.svg"
                                  : "assets/icons/user-pen.svg",
                              width: 22,
                              colorFilter: const ColorFilter.mode(
                                Colors.white,
                                BlendMode.srcIn,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Text("$error"),
          ),
          loading: () => const Center(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator.adaptive(),
            ),
          ),
        );
  }
}
