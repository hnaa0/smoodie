import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';

class MoodCard extends StatelessWidget {
  const MoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 14,
        horizontal: 4,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: const BoxDecoration(
              color: Color(SmoodieColors.apricot),
              shape: BoxShape.circle,
            ),
          ),
          const Gap(20),
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "제목입니다.",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Gap(8),
                Text(
                  softWrap: true,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  "내용입니다. 사건은 다가와 아오에이 거세게 커져가 아오에이, 질문은 계속돼 아오에이 우린 어디서 왔나 오에이 사건은 다가와 아오에이 거세게 커져가 아오에이, 질문은 계속돼 아오에이 우린 어디서 왔나 오에이",
                  style: TextStyle(
                    color: Color(
                      SmoodieColors.gray_700,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
