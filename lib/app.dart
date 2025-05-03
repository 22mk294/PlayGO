import 'package:flutter/material.dart';
import 'routes/presentation/app_router.dart';
import 'config/theme.dart';

class PlayGoApp extends StatelessWidget {
  const PlayGoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'PlayGo',
      theme: AppTheme.light,
      routerConfig: AppRouter.router,
      debugShowCheckedModeBanner: false,
    );
  }
}
