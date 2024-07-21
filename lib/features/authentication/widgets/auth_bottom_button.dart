import 'package:flutter/material.dart';
import 'package:smoodie/constants/colors.dart';

class AuthBottomButton extends StatelessWidget {
  const AuthBottomButton({
    super.key,
    required this.buttonText,
    required this.onTapFunc,
  });

  final String buttonText;
  final Function onTapFunc;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.transparent,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () => onTapFunc(),
            child: Container(
              padding: const EdgeInsets.only(
                bottom: 4,
              ),
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 2,
                    color: Color(
                      SmoodieColors.apricot,
                    ),
                  ),
                ),
              ),
              child: Text(
                buttonText,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(
                    SmoodieColors.gray_500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
