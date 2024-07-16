import 'package:go_router/go_router.dart';
import 'package:smoodie/common/main_nav_screen.dart';
import 'package:smoodie/features/authentication/views/sign_in_screen.dart';
import 'package:smoodie/features/authentication/views/sign_up_screen.dart';

final router = GoRouter(
  initialLocation: SignInScreen.routeUrl,
  routes: [
    GoRoute(
      path: SignInScreen.routeUrl,
      name: SignInScreen.routeName,
      builder: (context, state) => const SignInScreen(),
    ),
    GoRoute(
      path: SignUpScreen.routeUrl,
      name: SignUpScreen.routeName,
      builder: (context, state) => const SignUpScreen(),
    ),
    GoRoute(
      path: "/:tab(home|write|analysis|profile|settings)",
      name: MainNavScreen.routeName,
      builder: (context, state) {
        final tab = state.pathParameters["tab"]!;

        return MainNavScreen(tab: tab);
      },
    ),
  ],
);
