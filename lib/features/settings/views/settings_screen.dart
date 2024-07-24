import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/authentication/view_models/auth_view_model.dart';
import 'package:smoodie/features/authentication/views/sign_in_screen.dart';
import 'package:smoodie/features/settings/views/widgets/list_tile_icon.dart';

class SettingsScreen extends ConsumerWidget {
  static const routeUrl = "/settings";
  static const routeName = "settings";

  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: ListView(
          children: [
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 56,
              child: const Text(
                "Settings",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 20,
                ),
              ),
            ),
            const AboutListTile(
              icon: ListTileIcon(
                path: "assets/icons/info.svg",
              ),
              applicationName: "Smoodie",
              applicationVersion: "1.0",
            ),
            const Divider(
              color: Color(
                SmoodieColors.gray_200,
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      backgroundColor: const Color(
                        SmoodieColors.gray_100,
                      ),
                      elevation: 0,
                      title: const Text(
                        "Smoodie에서 로그아웃 하시겠어요?",
                      ),
                      content: const Text(
                        "로그아웃 하더라도 저장된 무드는 삭제되지 않습니다.",
                        style: TextStyle(
                          color: Color(
                            SmoodieColors.gray_800,
                          ),
                        ),
                      ),
                      actionsPadding: const EdgeInsets.only(
                        bottom: 6,
                      ),
                      actions: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Divider(
                              color: Color(
                                SmoodieColors.gray_200,
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                ref.read(authProvider.notifier).signOut();
                                context.goNamed(SignInScreen.routeName);
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign out",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.redAccent,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            const Divider(
                              color: Color(
                                SmoodieColors.gray_200,
                              ),
                            ),
                            GestureDetector(
                              behavior: HitTestBehavior.translucent,
                              onTap: () {
                                context.pop();
                              },
                              child: const Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Cancel",
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                );
              },
              leading: const ListTileIcon(
                path: "assets/icons/sign-out.svg",
              ),
              title: const Text(
                "Sign Out",
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
