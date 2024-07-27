import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/analysis/view_models/analysis_view_model.dart';

class AnalysisScreen extends ConsumerWidget {
  static const routeUrl = "/analysis";
  static const routeName = "analysis";

  const AnalysisScreen({
    super.key,
    required this.selectedIndex,
  });

  final int selectedIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(analysisProvider).when(
          data: (types) {
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width,
                      height: 56,
                      child: const Text(
                        "Analysis",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: Color(SmoodieColors.gray_700),
                        ),
                      ),
                    ),
                    const Gap(40),
                    const Text(
                      "최근 한 달간 ㅇㅇ님이 자주 기록한 무드는",
                      style: TextStyle(
                        color: Color(
                          SmoodieColors.gray_800,
                        ),
                        fontSize: 16,
                      ),
                    ),
                    const Gap(10),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.end,
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        for (final type in types)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                            ),
                            decoration: BoxDecoration(
                              color: Color(type.key.color),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              type.key.name.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 20,
                                fontFamily: "InooAriDuri",
                                color: Colors.white,
                              ),
                            ),
                          ).animate().fadeIn(
                              duration: selectedIndex == 1 ? 500.ms : 0.ms),
                        const Text(
                          "입니다!",
                          style: TextStyle(
                            color: Color(
                              SmoodieColors.gray_800,
                            ),
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                    const Gap(52),
                    ShaderMask(
                      blendMode: BlendMode.srcIn,
                      child: const Text(
                        "TOP 3",
                        style: TextStyle(
                          fontSize: 22,
                          fontFamily: "InooAriDuri",
                        ),
                      ),
                      shaderCallback: (bounds) => const LinearGradient(
                        colors: [
                          Color(SmoodieColors.atomicTangerine),
                          Color(SmoodieColors.coralPink),
                        ],
                      ).createShader(
                        Rect.fromLTWH(
                          0,
                          0,
                          bounds.width,
                          bounds.height,
                        ),
                      ),
                    ),
                    const Gap(10),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 18,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: const Color(
                            SmoodieColors.gray_300,
                          ),
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        children: [
                          for (final type in types) ...[
                            Row(
                              children: [
                                Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Color(
                                      type.key.color,
                                    ),
                                  ),
                                ),
                                const Gap(14),
                                Text(
                                  type.key.name.toUpperCase(),
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: "InooAriDuri",
                                    color: Color(
                                      type.key.color,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                                Text(
                                  "${type.value}",
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w600,
                                    color: Color(
                                      SmoodieColors.gray_600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const Gap(20),
                          ]
                        ],
                      ),
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
