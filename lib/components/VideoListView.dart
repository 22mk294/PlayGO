// Importation des outils UI de Flutter
import 'package:flutter/material.dart';
import 'ItemMenuButton.dart'; // Bouton de menu pour les actions

// Widget affichant une liste de vidéos filtrées
class VideoListView extends StatelessWidget {
  final String query; // Terme de recherche pour filtrer les vidéos

  // Constructeur du widget
  const VideoListView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    // Liste statique de vidéos disponibles
    final videos = [
      "Flutter Intro",
      "React Native Basics",
      "PlayGo Tutorial",
      "Animation avec Flutter",
    ];

    // Filtrage des vidéos selon la recherche
    final filtered = videos
        .where((v) => v.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Expanded(
      child: ListView.builder( // Affichage dynamique de la liste
        itemCount: filtered.length, // Nombre d'éléments affichés
        itemBuilder: (context, index) {
          final item = filtered[index];

          return ListTile(
            leading: const Icon(Icons.video_library), // Icône de vidéo
            title: Text(item), // Affichage du titre de la vidéo
            subtitle: const Text("Vidéo disponible"), // Indicateur de disponibilité
            trailing: ItemMenuButton( // Bouton de menu contextuel
              onDelete: () {
                // Affichage d'une notification lorsqu'une vidéo est supprimée
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('$item supprimé')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}