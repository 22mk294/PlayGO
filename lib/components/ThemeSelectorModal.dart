// Importation des outils UI de Flutter
import 'package:flutter/material.dart';

// Widget permettant de sélectionner un thème via une boîte modale
class ThemeSelectorModal extends StatelessWidget {
  final void Function(String) onThemeChange; // Fonction appelée lorsqu'un thème est sélectionné

  // Constructeur du widget
  const ThemeSelectorModal({required this.onThemeChange, super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea( // Empêche le chevauchement avec les barres système
      child: Wrap( // Organisation fluide des éléments du menu
        children: [
          // Option "Thème Bleu"
          ListTile(
            title: const Text('Thème Bleu'),
            onTap: () {
              onThemeChange("blue"); // Envoie la sélection
              Navigator.pop(context); // Ferme la boîte de dialogue
            },
          ),
          // Option "Thème Noir"
          ListTile(
            title: const Text('Thème Noir'),
            onTap: () {
              onThemeChange("dark");
              Navigator.pop(context);
            },
          ),
          // Option "Thème Blanc"
          ListTile(
            title: const Text('Thème Blanc'),
            onTap: () {
              onThemeChange("light");
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}