import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/view_models/fetch_mood_view_model.dart';
import 'package:smoodie/features/mood/views/widgets/home_sliver_app_bar.dart';
import 'package:smoodie/features/mood/views/widgets/mood_card.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/home";
  static const routeName = "home";

  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(
      0,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(fetchMoodProvider).when(
          data: (moods) {
            return SafeArea(
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  HomeSliverAppBar(scrollTop: _scrollToTop),
                  const SliverGap(10),
                  moods.isEmpty
                      ? SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(100),
                              const Text(
                                "It's empty :(",
                                style: TextStyle(
                                  fontSize: 32,
                                  fontFamily: "InooAriDuri",
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color:
                                          Color(SmoodieColors.atomicTangerine),
                                      blurRadius: 24,
                                      offset: Offset(0, 0),
                                    ),
                                  ],
                                ),
                              )
                                  .animate(
                                    delay: 300.ms,
                                    onPlay: (controller) => controller.repeat(
                                      period: 2500.ms,
                                    ),
                                  )
                                  .shake(
                                    hz: 2,
                                    duration: 600.ms,
                                    delay: 2.seconds,
                                  ),
                              const Gap(4),
                              const Text(
                                "Record your mood!",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Color(
                                    SmoodieColors.coralPink,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      : SliverPadding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          sliver: SliverList.separated(
                            itemCount: moods.length,
                            itemBuilder: (context, index) {
                              final mood = moods[index];
                              return MoodCard(mood: mood);
                            },
                            separatorBuilder: (context, index) => const Divider(
                              color: Color(
                                SmoodieColors.gray_200,
                              ),
                            ),
                          ),
                        ),
                  const SliverGap(40),
                ],
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
