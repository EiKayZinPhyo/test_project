import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/app/presentation/widget/custom_widget/custom_curve.dart';
import 'package:test_project/app/presentation/widget/signin_widget/sigin_widget.dart';
import 'package:test_project/app/provider/sign_in/sign_in_provider.dart';

class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    emailController.addListener(() {
      if (emailController.text.trim().isNotEmpty) {
        if (emailRegex.hasMatch(emailController.text.trim())) {
          ref
              .read(signInEmailTextNotifierProvider.notifier)
              .changeValue(emailController.text.trim());
        } else {
          ref.read(signInEmailTextNotifierProvider.notifier).changeValue(null);
        }
      } else {
        ref.read(signInEmailTextNotifierProvider.notifier).changeValue(null);
      }
    });

    passwordController.addListener(() {
      if (passwordController.text.trim().isNotEmpty) {
        ref
            .read(signInPasswordTextNotifierProvider.notifier)
            .changeValue(passwordController.text.trim());
      } else {
        ref.read(signInPasswordTextNotifierProvider.notifier).changeValue(null);
      }
    });
  }



  @override
  void dispose() {
    emailController.dispose();
    emailFocusNode.dispose();
    passwordController.dispose();
    passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
      body: Stack(
        children: [
          CustomCurve(
            showBackButton: false,
            customColor: Colors.purple,
          ),
          SignInScreenWidget(
            emailController: emailController,
            emailFocusNode: emailFocusNode,
            passwordController: passwordController,
            passwordFocusNode: passwordFocusNode,
          ),
        ],
      ),
    );
  }
}
