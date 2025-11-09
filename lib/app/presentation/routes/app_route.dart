import 'package:test_project/app/presentation/routes/route_screen.dart';
import 'package:go_router/go_router.dart';
import 'package:test_project/app/presentation/screen/sign_in_screen/sign_in_screen.dart';
import 'package:test_project/app/presentation/screen/welcome_screen/welcome_screen.dart';


final startRouter = GoRouter(
  routes: AppScreen.screens,

  initialLocation: "/${RouteNames.signInScreen}",
);

abstract class AppScreen {
  static final screens = [
    GoRoute(
      name: RouteNames.signInScreen,
      path: "/${RouteNames.signInScreen}",
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      name: RouteNames.welcomeScreen,
      path: "/${RouteNames.welcomeScreen}",
      builder: (context, state) => const WelcomeScreen(),
    )
  ];
}