// Importation des outils UI et des fichiers nécessaires
import 'package:flutter/material.dart';
import '../screens/AudioPlayerScreen.dart'; // Écran de lecture audio
import 'ItemMenuButton.dart'; // Bouton pour les actions sur un élément

// Définition d'un modèle de données pour représenter un morceau audio
class AudioItem {
  final String title; // Titre du morceau
  final String artist; // Nom de l'artiste
  final String duration; // Durée du morceau

  // Constructeur de la classe AudioItem
  AudioItem(this.title, this.artist, this.duration);
}

// Définition du widget AudioListView (stateless)
class AudioListView extends StatelessWidget {
  // Liste des morceaux audio disponibles
  final List<AudioItem> audioItems = [
    AudioItem("Travel Vibes", "Artist Name", "3:45"),
    AudioItem("Soothing Sounds", "Artist Name", "2:58"),
    AudioItem("Chill Nights", "Artist Name", "4:20"),
    AudioItem("Summer Tune", "Artist Name", "2:33"),
    AudioItem("Mellow Beats", "Artist Name", "3:02"),
    AudioItem("Peaceful Piano", "Artist Name", "3:55"),
  ];

  final String query; // Terme de recherche

  // Constructeur du widget
  AudioListView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    // Filtrage des morceaux selon la recherche
    final filteredItems = audioItems
        .where((item) => item.title.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return Expanded(
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8), // Espacement
        itemCount: filteredItems.length, // Nombre d'éléments affichés
        separatorBuilder: (_, __) => const SizedBox(height: 12), // Séparateurs entre éléments
        itemBuilder: (context, index) {
          final item = filteredItems[index];

          return GestureDetector(
            onTap: () { // Lorsqu'un utilisateur clique sur un morceau
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => AudioPlayerScreen(
                    title: item.title, // Passage du titre à l'écran de lecture
                    artist: item.artist, // Passage du nom de l'artiste
                    duration: item.duration, // Passage de la durée
                  ),
                ),
              );
            },
            child: Row(
              children: [
                // Icône musicale dans un conteneur circulaire
                Container(
                  width: 56,
                  height: 56,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.9),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.music_note, color: Colors.blue),
                ),
                const SizedBox(width: 16), // Espacement entre icône et texte
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Affichage du titre en gras
                      Text(item.title,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          )),
                      // Affichage du nom de l'artiste
                      Text(item.artist,
                          style: Theme.of(context).textTheme.bodyMedium),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    // Affichage de la durée du morceau
                    Text(item.duration,
                        style: Theme.of(context).textTheme.bodyMedium),
                    // Bouton d'action (exemple : suppression)
                    ItemMenuButton(
                      onDelete: () {
                        // Affichage d'une notification lorsqu'un morceau est supprimé
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('${item.title} supprimé')),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}