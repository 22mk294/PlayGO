// Importation des outils UI et des écrans de l'application
import 'package:flutter/material.dart';
import '../screens/HomeScreen.dart';
import '../screens/SettingsScreen.dart';
import '../screens/VideoScreen.dart';

// Widget principal gérant la navigation entre les écrans
class AppNavigator extends StatefulWidget {
  final void Function(String) onThemeChange; // Fonction permettant de changer le thème

  // Constructeur du widget
  const AppNavigator({required this.onThemeChange, super.key});

  @override
  State<AppNavigator> createState() => _AppNavigatorState();
}

// Gestion de l'état du navigateur
class _AppNavigatorState extends State<AppNavigator> {
  int _currentIndex = 0; // Indice de l'onglet actif
  String searchQuery = ""; // Stocke la recherche en cours

  @override
  Widget build(BuildContext context) {
    // Définition des écrans avec la gestion de la recherche
    final screens = [
      HomeScreen(searchQuery: searchQuery, onSearchChanged: _setSearch),
      VideoScreen(searchQuery: searchQuery, onSearchChanged: _setSearch),
      SettingsScreen(onThemeChange: widget.onThemeChange),
    ];

    return Scaffold(
      body: screens[_currentIndex], // Affiche l'écran correspondant à l'index actif
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex, // Onglet actif
        onTap: (index) { // Lorsqu'on change d'onglet
          setState(() {
            _currentIndex = index; // Mise à jour de l'index
            searchQuery = ""; // Réinitialisation de la recherche
          });
        },
        items: const [ // Liste des onglets
          BottomNavigationBarItem(icon: Icon(Icons.music_note), label: "Audio"),
          BottomNavigationBarItem(icon: Icon(Icons.video_collection), label: "Vidéo"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Paramètres"),
        ],
      ),
    );
  }

  // Fonction pour mettre à jour la recherche
  void _setSearch(String query) {
    setState(() => searchQuery = query);
  }
}