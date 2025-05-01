import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/home/presentation/home_screen.dart';
import '../../features/audio_player/presentation/audio_player_screen.dart';
import '../../features/video_player/presentation/video_player_screen.dart';
import '../../features/settings/presentation/settings_screen.dart';

class AppRouter {
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        pageBuilder: (context, state) => _fadeTransition(const HomeScreen()),
      ),
      GoRoute(
        path: '/audio',
        pageBuilder: (context, state) => _fadeTransition(const AudioPlayerScreen()),
      ),
      GoRoute(
        path: '/video',
        pageBuilder: (context, state) => _fadeTransition(const VideoPlayerScreen()),
      ),
      GoRoute(
        path: '/settings',
        pageBuilder: (context, state) => _fadeTransition(const SettingsScreen()),
      ),
    ],
  );

  static CustomTransitionPage _fadeTransition(Widget child) {
    return CustomTransitionPage(
      child: child,
      transitionsBuilder: (context, animation, secondaryAnimation, child) =>
          FadeTransition(opacity: animation, child: child),
    );
  }
}
