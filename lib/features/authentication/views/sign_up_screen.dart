import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/authentication/models/field_type.dart';
import 'package:smoodie/features/authentication/view_models/auth_view_model.dart';
import 'package:smoodie/features/authentication/views/sign_in_screen.dart';
import 'package:smoodie/features/authentication/widgets/auth_bottom_button.dart';
import 'package:smoodie/features/authentication/widgets/auth_button.dart';
import 'package:smoodie/features/authentication/widgets/sign_up_field.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/sign-up";
  static const routeName = "sign-up";

  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignUpTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        ref.read(authProvider.notifier).signUp(
              context: context,
              name: _nameController.text,
              email: _emailController.text,
              password: _passwordController.text,
            );
      }
    }
  }

  void _onbottomButtonTap() {
    context.goNamed(SignInScreen.routeName);
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xffFAFAFA),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: 250,
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text(
                        "SMOODIE",
                        style: TextStyle(
                          fontFamily: "InooAriDuri",
                          fontSize: 32,
                          color: Color(
                            SmoodieColors.atomicTangerine,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 52,
                    ),
                    child: Column(
                      children: [
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              SignUpField(
                                type: FieldType.name,
                                fieldController: _nameController,
                              ),
                              const Gap(14),
                              SignUpField(
                                type: FieldType.email,
                                fieldController: _emailController,
                              ),
                              const Gap(14),
                              SignUpField(
                                type: FieldType.password,
                                fieldController: _passwordController,
                              ),
                            ],
                          ),
                        ),
                        const Gap(14),
                        AuthButton(
                          buttonText: "Sign Up",
                          onButtonTap: _onSignUpTap,
                        ),
                        const Gap(40),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: AuthBottomButton(
          buttonText: "이미 계정이 있어요!",
          onTapFunc: _onbottomButtonTap,
        ),
      ),
    );
  }
}
