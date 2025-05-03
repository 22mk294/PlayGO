// Importation des outils UI de Flutter
import 'package:flutter/material.dart';

// Widget affichant l'écran de lecture audio
class AudioPlayerScreen extends StatelessWidget {
  final String title; // Titre du morceau
  final String artist; // Nom de l'artiste
  final String duration; // Durée du morceau

  // Constructeur du widget
  const AudioPlayerScreen({
    super.key,
    required this.title,
    required this.artist,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    // Récupération des couleurs du thème
    final theme = Theme.of(context);
    final primaryColor = theme.primaryColor; // Couleur principale
    final textColor = theme.textTheme.bodyLarge?.color ?? Colors.white; // Couleur du texte

    return Scaffold(
      backgroundColor: primaryColor, // Fond de l'écran
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0, // Supprime l'ombre sous la barre d'app
        leading: IconButton( // Bouton retour
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context), // Ferme l'écran
        ),
        title: Text('PlayGo', // Titre de la barre d'app
            style: TextStyle(fontWeight: FontWeight.bold, color: textColor)),
        centerTitle: true, // Centrage du titre
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center, // Centrage vertical
        children: [
          // Icône musicale en grand format
          Icon(Icons.music_note, size: 200, color: textColor.withOpacity(0.8)),
          const SizedBox(height: 32), // Espacement

          // Affichage du titre et de l'artiste
          Text(title, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textColor)),
          Text(artist, style: TextStyle(fontSize: 16, color: textColor.withOpacity(0.8))),
          const SizedBox(height: 32),

          // Barre de durée du morceau
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("1:25", style: TextStyle(color: textColor)), // Temps écoulé (valeur statique)
                Text(duration, style: TextStyle(color: textColor)), // Durée totale
              ],
            ),
          ),

          // Barre de progression du morceau
          Slider(
            value: 85, // Valeur test
            max: 225,
            onChanged: (_) {}, // Ne réagit pas pour l'instant
            activeColor: textColor,
            inactiveColor: textColor.withOpacity(0.3),
          ),
          const SizedBox(height: 32),

          // Boutons de contrôle audio
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Bouton "Précédent"
              IconButton(icon: Icon(Icons.skip_previous, size: 40, color: textColor), onPressed: () {}),
              const SizedBox(width: 24),

              // Bouton Lecture/Pause avec un style arrondi
              CircleAvatar(
                radius: 30,
                backgroundColor: textColor, // Fond du bouton
                child: Icon(Icons.pause, size: 40, color: primaryColor), // Icône Pause
              ),
              const SizedBox(width: 24),

              // Bouton "Suivant"
              IconButton(icon: Icon(Icons.skip_next, size: 40, color: textColor), onPressed: () {}),
            ],
          ),
        ],
      ),
    );
  }
}