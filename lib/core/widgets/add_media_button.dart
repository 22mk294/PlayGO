import 'package:flutter/material.dart';

class AddMediaButton extends StatelessWidget {
  final VoidCallback onPressed;

  const AddMediaButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0, right: 8.0),
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: onPressed,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
