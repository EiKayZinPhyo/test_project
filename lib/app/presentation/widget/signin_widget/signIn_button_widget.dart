import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_project/app/data/model/auth_model/auth_info_model.dart';
import 'package:test_project/app/data/model/auth_model/sign_in_payload.dart';
import 'package:test_project/app/presentation/routes/route_screen.dart';
import 'package:test_project/app/presentation/widget/custom_widget/custom_buttom.dart';
import 'package:test_project/app/presentation/widget/custom_widget/custom_dialog.dart';
import 'package:test_project/app/presentation/widget/custom_widget/custom_text.dart';
import 'package:test_project/app/provider/auth_provider/auth_sign_in_provider.dart';
import 'package:test_project/app/provider/sign_in/sign_in_provider.dart';



class SignInAuthButtonWidget extends ConsumerWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const SignInAuthButtonWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final emailText = ref.watch(signInEmailTextNotifierProvider);
    final passwordText = ref.watch(signInPasswordTextNotifierProvider);

    final authSignInResult = ref.watch(authSignInNotifierProvider);

    ref.listen(authSignInNotifierProvider, (previous, next) {
      next.whenOrNull(
        data: (AuthInfoModel? data) {
          if (data != null) {
            if (emailText != null && passwordText != null) {
              if (data.personFormInformation?.register ?? false) {
                 context.pushReplacementNamed(RouteNames.welcomeScreen);
              } else {
              }
              ref
                  .read(signInEmailTextNotifierProvider.notifier)
                  .changeValue(null);
              ref
                  .read(signInPasswordTextNotifierProvider.notifier)
                  .changeValue(null);
              emailController.clear();
              passwordController.clear();
            }
          }
        },
        error: (error, stackTrace) {
          if (error is DioException) {
            if (error.response?.statusCode == 404) {
              log("error ${error.response?.statusCode}");
              CustomDialog.showErrorDialog(
                context,
                message:
                "It looks like there is no account associated with the credentials you entered. Please double-check and try again.",
                title: "No Account",
              );
              return;
            } else if (error.response?.statusCode == 401) {
              CustomDialog.showErrorDialog(
                context,
                message:
                "We couldn’t verify your email or password. Please try again.",
                title: "Invalid Credential",
              );
              return;
            }
          }
          CustomDialog.showErrorDialog(
            context,
            message:
            "Please try again in a moment. If this keeps happening, check your connection.",
            title: "Something went wrong",
          );
        },
      );
    });



    return CustomButton(
      onPressed: () {
        if ((emailText != null && passwordText != null) &&
            !authSignInResult.isLoading) {
          ref
              .refresh(authSignInNotifierProvider.notifier)
              .signIn(SignInPayLoad(email: emailText, password: passwordText));
        }
      },
      disable: (emailText != null && passwordText != null) ? false : true,
      color: Colors.purple,
      textColor: Colors.white,
      text: '',
      child:
      authSignInResult.isLoading
          ? SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator.adaptive(
          strokeWidth: 1,
          backgroundColor: Colors.white,
        ),
      )
          :
      CustomText(
        text: "Sign in",
        color: Colors.white,
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
