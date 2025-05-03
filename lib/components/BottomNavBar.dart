// Importation des outils UI de Flutter
import 'package:flutter/material.dart';

// Définition d'un widget stateless (sans état)
class BottomNavBar extends StatelessWidget {
  final int selectedIndex; // Index de l'élément actuellement sélectionné
  final Function(int) onItemTapped; // Fonction de rappel lorsqu'un élément est cliqué

  // Constructeur du widget
  const BottomNavBar({
    required this.selectedIndex, // L’index est obligatoire
    required this.onItemTapped, // La fonction de gestion des clics est obligatoire
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar( // Création de la barre de navigation inférieure
      backgroundColor: Theme.of(context).primaryColor, // Couleur principale du thème
      selectedItemColor: Colors.white, // Couleur des éléments sélectionnés
      unselectedItemColor: Colors.white60, // Couleur des éléments non sélectionnés
      currentIndex: selectedIndex, // Détermine l'élément actif
      onTap: onItemTapped, // Appelle la fonction de gestion des clics
      items: const [ // Liste des éléments de navigation
        BottomNavigationBarItem(
          icon: Icon(Icons.music_note), // Icône musicale
          label: 'Audio', // Libellé du bouton
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.play_circle), // Icône de lecture
          label: 'Vidéo', // Libellé du bouton
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings), // Icône d'engrenage
          label: 'Paramètres', // Libellé du bouton
        ),
      ],
    );
  }
}