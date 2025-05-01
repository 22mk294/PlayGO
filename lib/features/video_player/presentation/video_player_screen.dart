import 'package:flutter/material.dart';
import '../../../core/widgets/app_top_bar.dart';
import '../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../core/widgets/add_media_button.dart';
import 'package:go_router/go_router.dart';

class VideoPlayerScreen extends StatefulWidget {
  const VideoPlayerScreen({super.key});

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  int _selectedIndex = 1;

  void _onItemTapped(int index) {
    if (index == 0) context.go('/audio');
    if (index == 2) context.go('/settings');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppTopBar(),
      body: const Center(child: Text("Lecteur Vidéo")),
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
