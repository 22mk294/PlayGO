import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/widgets/app_top_bar.dart';
import '../../../core/widgets/app_bottom_nav_bar.dart';
import '../../../core/widgets/add_media_button.dart';
import '../logic/home_controller.dart';
import 'dart:io';

import '../logic/media_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController _controller = HomeController();
  List<File> _mediaFiles = [];

  void _handleAddMedia() async {
    try {
      List<File> files = await _controller.addMediaFiles();
      Provider.of<MediaProvider>(context, listen: false).addMediaFiles(files);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Médias ajoutés avec succès')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.toString())),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final mediaProvider = context.watch<MediaProvider>();

    // Tu peux fusionner les fichiers audio + vidéo ici
    final allMedia = [...mediaProvider.audioFiles, ...mediaProvider.videoFiles];

    return Scaffold(
      appBar: const AppTopBar(title: "Accueil"), // ← ici aussi
      body: allMedia.isEmpty
          ? const Center(child: Text("Aucun média trouvé."))
          : ListView.builder(
        itemCount: allMedia.length,
        itemBuilder: (context, index) {
          final file = allMedia[index];
          return ListTile(
            title: Text(file.path.split('/').last),
          );
        },
      ),
      floatingActionButton: AddMediaButton(onPressed: _handleAddMedia),
      bottomNavigationBar: AppBottomNavBar(
        currentIndex: 0,
        onTap: (index) {
          // Navigation vers Audio, Vidéo, Paramètres
          if (index == 1) {
            Navigator.pushNamed(context, '/audio');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/video');
          } else if (index == 3) {
            Navigator.pushNamed(context, '/settings');
          }
        },
      ),
    );
  }

}

