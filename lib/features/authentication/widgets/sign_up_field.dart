import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/authentication/models/field_type.dart';

class SignUpField extends StatefulWidget {
  const SignUpField({
    super.key,
    required this.type,
    required this.fieldController,
  });

  final FieldType type;
  final TextEditingController fieldController;

  @override
  State<SignUpField> createState() => _SignUpFieldState();
}

class _SignUpFieldState extends State<SignUpField> {
  bool _isHidden = true;

  void _onEyeTap() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _onClearTap() {
    widget.fieldController.clear();
  }

  bool _nameValidCheck(String value) {
    return value.length < 2 ? false : true;
  }

  bool _emailValidCheck(String value) {
    var pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    return RegExp(pattern).hasMatch(value);
  }

  bool _passwordValidCheck(String value) {
    var pattern = r'^(?=.*[a-zA-Z]).{8,}$';

    return RegExp(pattern).hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.fieldController,
      obscureText:
          _isHidden && widget.type == FieldType.password ? true : false,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        fillColor: Colors.white,
        isDense: true,
        labelText: widget.type.name.toUpperCase(),
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
        errorMaxLines: 2,
        errorStyle: const TextStyle(
          color: Colors.redAccent,
          fontSize: 10,
        ),
        suffixIcon: widget.type == FieldType.password
            ? GestureDetector(
                onTap: _onEyeTap,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                    right: 14,
                    bottom: 14,
                  ),
                  child: SvgPicture.asset(
                    _isHidden
                        ? "assets/icons/eye-crossed.svg"
                        : "assets/icons/eye.svg",
                    colorFilter: const ColorFilter.mode(
                      Color(SmoodieColors.gray_300),
                      BlendMode.srcIn,
                    ),
                    width: 16,
                    height: 16,
                  ),
                ),
              )
            : GestureDetector(
                onTap: _onClearTap,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 14,
                    right: 14,
                    bottom: 14,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/cross-circle.svg",
                    colorFilter: const ColorFilter.mode(
                      Color(SmoodieColors.gray_300),
                      BlendMode.srcIn,
                    ),
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
      ),
      validator: (value) {
        switch (widget.type) {
          case FieldType.name:
            if (value != null && !_nameValidCheck(value)) {
              return "이름은 2글자 이상이어야 합니다.";
            }
          case FieldType.email:
            if (value != null && !_emailValidCheck(value)) {
              return "유효한 이메일을 입력해주세요.";
            }
          case FieldType.password:
            if (value != null && !_passwordValidCheck(value)) {
              return "비밀번호는 문자를 포함한 8글자 이상이어야 합니다.";
            }
        }
        return null;
      },
    );
  }
}
