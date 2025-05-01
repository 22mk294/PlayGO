import 'package:flutter/material.dart';
import '../../../core/widgets/app_top_bar.dart';
import '../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../core/widgets/add_media_button.dart';
import 'package:go_router/go_router.dart';

class AudioPlayerScreen extends StatefulWidget {
  const AudioPlayerScreen({super.key});

  @override
  State<AudioPlayerScreen> createState() => _AudioPlayerScreenState();
}

class _AudioPlayerScreenState extends State<AudioPlayerScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    if (index == 1) context.go('/video');
    if (index == 2) context.go('/settings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(),
      body: const Center(child: Text("Lecteur Audio")),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: AddMediaButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Ajouter un média')),
          );
        },
      ),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
