import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/mood/views/write_screen.dart';

class WriteField extends StatelessWidget {
  const WriteField({
    super.key,
    required this.type,
  });

  final WriteFieldType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 4,
          ),
          child: Text(
            type.name.toUpperCase(),
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Color(SmoodieColors.coralPink),
            ),
          ),
        ),
        const Gap(8),
        TextFormField(
          maxLines: type == WriteFieldType.content ? 5 : 1,
          decoration: InputDecoration(
            fillColor: Colors.white,
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 14,
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(SmoodieColors.apricot),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(SmoodieColors.coralPink),
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.redAccent,
              ),
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
      ],
    );
  }
}
