import 'package:all_events/features/authentication/presentation/screens/login_screen.dart';
import 'package:all_events/features/authentication/presentation/screens/splash_screen.dart';
import 'package:all_events/features/home/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../features/home/presentation/screens/web_view_screen.dart';

part 'app_router.g.dart';

enum Routes {
  splash,
  home,
  login,
  webview,
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();

@Riverpod(keepAlive: true)
GoRouter goRouter(GoRouterRef ref) {
  return GoRouter(
    initialLocation: '/',
    navigatorKey: _rootNavigatorKey,
    debugLogDiagnostics: true,
    routes: [
      GoRoute(
        path: '/',
        name: Routes.splash.name,
        builder: (context, state) => SplashScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/login',
        name: Routes.login.name,
        builder: (context, state) => LoginScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/home',
        name: Routes.home.name,
        builder: (context, state) => HomeScreen(
          key: state.pageKey,
        ),
      ),
      GoRoute(
        path: '/webview/:title/:url',
        name: Routes.webview.name,
        builder: (context, state) {
          final url = Uri.decodeComponent(state.pathParameters['url'] ?? "");
          final title = state.pathParameters['title'] ?? "";
          return WebViewScreen(url: url, title: title);
        },
      ),
    ],
  );
}
