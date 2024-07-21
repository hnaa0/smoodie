import 'package:flutter/material.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/authentication/models/field_type.dart';

class SignInField extends StatelessWidget {
  const SignInField({
    super.key,
    required this.type,
    required this.fieldController,
  });

  final FieldType type;
  final TextEditingController fieldController;

  @override
  Widget build(BuildContext context) {
    bool emailValidCheck(String value) {
      var pattern =
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

      return RegExp(pattern).hasMatch(value);
    }

    return TextFormField(
      obscureText: type == FieldType.password ? true : false,
      controller: fieldController,
      decoration: InputDecoration(
        fillColor: Colors.white,
        isDense: true,
        labelText: type.name.toUpperCase(),
        labelStyle: const TextStyle(
          color: Color(
            SmoodieColors.gray_300,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(
              SmoodieColors.gray_200,
            ),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Color(
              SmoodieColors.teaGreen,
            ),
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.redAccent,
            width: 1.5,
          ),
          borderRadius: BorderRadius.circular(32),
        ),
      ),
      validator: (value) {
        if (value != null) {
          if (type == FieldType.email && !emailValidCheck(value)) {
            return "유효한 이메일을 입력해주세요.";
          }
        }
        return null;
      },
    );
  }
}
