import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:test_project/app/presentation/widget/custom_widget/custom_text.dart';
import 'package:test_project/app/presentation/widget/custom_widget/custom_textfield_widget.dart';
import 'package:test_project/app/presentation/widget/signin_widget/signIn_button_widget.dart';
import 'package:test_project/app/provider/sign_in/sign_in_provider.dart';

class SignInScreenWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final FocusNode emailFocusNode;
  final FocusNode passwordFocusNode;

  const SignInScreenWidget({
    super.key,
    required this.emailController,
    required this.emailFocusNode,
    required this.passwordController,
    required this.passwordFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Align(
        alignment: Alignment.center,
        child: GestureDetector(
          onTap: () {
            emailFocusNode.unfocus();
            passwordFocusNode.unfocus();
          },
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Spacer(),
                  SizedBox(height: 50),
                  Image.asset(
                    "assets/images/logo.png",
                    height: 0.12 * MediaQuery.of(context).size.height,
                  ),
                  const SizedBox(height: 20),
                  CustomText(
                    text: "Sign in to your serenity account",
                    textAlign: TextAlign.center,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),

                  const SizedBox(height: 40),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CustomText(
                        text: "email",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 10),
                      CustomTextField(
                        hintText: "enter_email",
                        focusNode: emailFocusNode,
                        passwordShow: true,
                        controller: emailController,
                        textFieldColor: Theme.of(
                          context,
                        ).colorScheme.onSecondary.withValues(alpha: 0.2),
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: Icons.email_outlined,
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const CustomText(
                        text: "Password",
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      SizedBox(height: 10),
                      Consumer(
                        builder: (context, ref, child) {
                          final showPassword =ref.watch(signInPasswordShowNotifierProvider);
                          return CustomTextField(
                            hintText: "Enter your password",
                            focusNode: passwordFocusNode,
                            isPassword: true,
                            passwordShow: showPassword,
                            passwordCallBack: () {
                              ref.watch(signInPasswordShowNotifierProvider.notifier).changeValue();
                            },
                            controller: passwordController,
                            textFieldColor: Theme.of(
                              context,
                            ).colorScheme.onSecondary.withValues(alpha: 0.2),
                            keyboardType: TextInputType.text,
                            prefixIcon: Icons.lock,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                        },
                        child: CustomText(
                          text: "forget_password",
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          textAlign: TextAlign.right,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  SignInAuthButtonWidget(
                    emailController: emailController,
                    passwordController: passwordController,
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(width: 2),
                      Expanded(
                        child: Divider(
                          color: Theme.of(
                            context,
                          ).colorScheme.onTertiary.withValues(alpha: 0.2),
                          thickness: 0.8,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        'Or Sign In With',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          color: Theme.of(
                            context,
                          ).colorScheme.onTertiary.withValues(alpha: 0.3),
                          thickness: 1,
                          indent: 10,
                        ),
                      ),
                      SizedBox(width: 2),
                    ],
                  ),
                  SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
