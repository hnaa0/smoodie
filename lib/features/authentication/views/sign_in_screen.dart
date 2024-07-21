import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:smoodie/constants/colors.dart';
import 'package:smoodie/features/authentication/models/field_type.dart';
import 'package:smoodie/features/authentication/view_models/auth_view_model.dart';
import 'package:smoodie/features/authentication/views/sign_up_screen.dart';
import 'package:smoodie/features/authentication/widgets/auth_bottom_button.dart';
import 'package:smoodie/features/authentication/widgets/auth_button.dart';
import 'package:smoodie/features/authentication/widgets/sign_in_field.dart';

class SignInScreen extends ConsumerStatefulWidget {
  static const routeUrl = "/sign-in";
  static const routeName = "sign-in";

  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _onSignInTap() {
    if (ref.watch(authProvider).isLoading) return;

    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        ref.read(authProvider.notifier).signIn(
              context: context,
              email: _emailController.text,
              password: _passwordController.text,
            );
      }
    }
  }

  void _onbottomButtonTap() {
    FocusScope.of(context).unfocus();
    context.goNamed(SignUpScreen.routeName);
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
                              SignInField(
                                type: FieldType.email,
                                fieldController: _emailController,
                              ),
                              const Gap(12),
                              SignInField(
                                type: FieldType.password,
                                fieldController: _passwordController,
                              ),
                            ],
                          ),
                        ),
                        const Gap(12),
                        AuthButton(
                          buttonText: "Sign In",
                          onButtonTap: _onSignInTap,
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
          buttonText: "계정이 없어요!",
          onTapFunc: _onbottomButtonTap,
        ),
      ),
    );
  }
}
