import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'features/home/logic/media_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => MediaProvider(),
      child: const PlayGoApp(),
    ),
  );
}
