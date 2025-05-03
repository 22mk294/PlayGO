// Importation des outils UI et des composants externes
import 'package:flutter/material.dart';
import '../components/HeaderBar.dart'; // Barre d'application
import '../components/ThemeSelectorModal.dart'; // Boîte modale pour la sélection du thème

// Widget SettingsScreen (écran des paramètres)
class SettingsScreen extends StatelessWidget {
  final void Function(String) onThemeChange; // Fonction appelée lorsqu'un thème est sélectionné

  // Constructeur du widget
  const SettingsScreen({required this.onThemeChange, super.key});

  // Méthode permettant d'ouvrir le sélecteur de thème
  void _openThemeSelector(BuildContext context) {
    showModalBottomSheet( // Affichage du menu en bas de l'écran
      context: context,
      builder: (_) => ThemeSelectorModal(onThemeChange: onThemeChange), // Widget externe gérant le choix du thème
      shape: const RoundedRectangleBorder( // Bordure arrondie en haut du menu
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: HeaderBar(title: 'Paramètres'), // Affichage du titre "Paramètres"
      ),
      body: ListView( // Affichage sous forme de liste
        children: [
          ListTile( // Option de personnalisation du thème
            title: const Text('Personnaliser thème'),
            subtitle: const Text('Choisissez un thème clair, bleu ou noir'), // Description
            trailing: const Icon(Icons.chevron_right), // Icône indiquant une action supplémentaire
            onTap: () => _openThemeSelector(context), // Appelle le menu de sélection du thème
          ),
        ],
      ),
    );
  }
}