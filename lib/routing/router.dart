import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vpn_app/presentation/screens/home_screen.dart';
import 'package:vpn_app/presentation/screens/layout.dart';
import 'package:vpn_app/presentation/screens/splash_screen.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => SplashScreen(),
      pageBuilder:
          (context, state) => CustomTransitionPage(
            child: SplashScreen(),
            transitionsBuilder: (
              context,
              animation,
              secondaryAnimation,
              child,
            ) {
              // Используем анимацию fade
              return FadeTransition(opacity: animation, child: child);
            },
          ),
    ),
    GoRoute(
      path: '/main',
      builder: (context, state) => Layout(child: HomeScreen()),
    ),
  ],
);
