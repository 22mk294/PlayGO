// lib/components/MediaAddButton.dart
import 'package:flutter/material.dart';

class MediaAddButton extends StatelessWidget {
  final VoidCallback onPressed;

  const MediaAddButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      backgroundColor: Theme.of(context).colorScheme.secondary,
      elevation: 6,
      child: const Icon(Icons.add, size: 32),
    );
  }
}
