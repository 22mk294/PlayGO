// Importation des outils UI de Flutter
import 'package:flutter/material.dart';

// Widget stateless permettant de sélectionner un thème
class ThemeSelector extends StatelessWidget {
  final void Function(String) onThemeChange; // Fonction appelée lorsqu'un thème est sélectionné

  // Constructeur du widget
  const ThemeSelector({required this.onThemeChange, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start, // Alignement du contenu à gauche
      children: [
        // Titre du menu de sélection de thème
        const Text("Personnaliser le thème",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        const SizedBox(height: 8), // Espacement

        // Ligne contenant les boutons de sélection de thème
        Row(
          children: [
            // Bouton pour activer le thème bleu
            ElevatedButton(
              onPressed: () => onThemeChange("blue"), // Appel de la fonction avec "blue"
              child: const Text("Bleu"),
            ),
            const SizedBox(width: 8), // Espacement entre boutons

            // Bouton pour activer le thème sombre
            ElevatedButton(
              onPressed: () => onThemeChange("dark"), // Appel de la fonction avec "dark"
              child: const Text("Noir"),
            ),
            const SizedBox(width: 8), // Espacement entre boutons

            // Bouton pour activer le thème clair
            ElevatedButton(
              onPressed: () => onThemeChange("light"), // Appel de la fonction avec "light"
              child: const Text("Blanc"),
            ),
          ],
        ),
      ],
    );
  }
}