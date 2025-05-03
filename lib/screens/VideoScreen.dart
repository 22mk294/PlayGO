import 'package:flutter/material.dart';
import '../components/HeaderBar.dart'; // Barre d'application avec recherche
import '../components/VideoListView.dart'; // Liste des vidéos
import '../components/MediaAddButton.dart'; // Bouton d'ajout média

class VideoScreen extends StatelessWidget {
  final String searchQuery;
  final void Function(String) onSearchChanged;

  const VideoScreen({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: HeaderBar(
          title: "Playgo",
          onSearchChanged: onSearchChanged,
        ),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Vidéos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          VideoListView(query: searchQuery),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 64.0), // Décalage vers le haut
        child: Align(
          alignment: Alignment.bottomRight,
          child: MediaAddButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Ajout d'une vidéo déclenché")),
              );
            },
          ),
        ),
      ),
    );
  }
}
