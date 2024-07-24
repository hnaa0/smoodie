import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smoodie/constants/colors.dart';

class ListTileIcon extends StatelessWidget {
  const ListTileIcon({
    super.key,
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      path,
      width: 20,
      colorFilter: const ColorFilter.mode(
        Color(
          SmoodieColors.gray_700,
        ),
        BlendMode.srcIn,
      ),
    );
  }
}
