import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:smoodie/common/main_nav_screen.dart';
import 'package:smoodie/features/authentication/repos/auth_repository.dart';
import 'package:smoodie/features/authentication/views/sign_in_screen.dart';
import 'package:smoodie/features/authentication/views/sign_up_screen.dart';
import 'package:smoodie/features/mood/views/home_screen.dart';

final routerProvider = Provider(
  (ref) {
    return GoRouter(
      initialLocation: HomeScreen.routeUrl,
      redirect: (context, state) {
        final isLoggedIn = ref.read(authRepo).isLoggedIn;

        if (isLoggedIn) return null;

        if (!isLoggedIn) {
          if (state.matchedLocation != SignInScreen.routeUrl &&
              state.matchedLocation != SignUpScreen.routeUrl) {
            return SignInScreen.routeUrl;
          }
        }
        return null;
      },
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
  },
);
