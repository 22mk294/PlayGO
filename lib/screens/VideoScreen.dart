// Importation des outils UI et des composants externes
import 'package:flutter/material.dart';
import '../components/HeaderBar.dart'; // Barre d'application avec recherche
import '../components/VideoListView.dart'; // Liste des vidéos

// Widget VideoScreen (écran des vidéos)
class VideoScreen extends StatelessWidget {
  final String searchQuery; // Texte de recherche actif
  final void Function(String) onSearchChanged; // Callback pour mettre à jour la recherche

  // Constructeur du widget
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
        child: HeaderBar( // Barre d'application avec recherche dynamique
          title: "Playgo",
          onSearchChanged: onSearchChanged,
        ),
      ),
      body: Column(
        children: [
          // Titre "Vidéos"
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Vidéos',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          // Affichage de la liste des vidéos filtrées
          VideoListView(query: searchQuery),
        ],
      ),
    );
  }
}