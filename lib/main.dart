// Importation des outils UI et des fichiers nécessaires
import 'package:flutter/material.dart';
import 'themes/appTheme.dart'; // Fichier contenant les thèmes personnalisés
import 'navigation/AppNavigator.dart'; // Fichier gérant la navigation entre les écrans

// Point d’entrée de l’application Flutter
void main() {
  runApp(const MyApp()); // Démarrage de l’application
}

// Widget principal gérant le thème et la navigation
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

// Gestion de l’état du thème
class _MyAppState extends State<MyApp> {
  ThemeData currentTheme = AppThemes.blueTheme; // Thème par défaut

  // Fonction permettant de changer de thème dynamiquement
  void switchTheme(String name) {
    setState(() { // Met à jour l'état du thème
      if (name == "dark") currentTheme = AppThemes.darkTheme; // Thème sombre
      else if (name == "light") currentTheme = AppThemes.lightTheme; // Thème clair
      else currentTheme = AppThemes.blueTheme; // Thème bleu (par défaut)
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Supprime le bandeau "Debug"
      theme: currentTheme, // Applique le thème sélectionné
      home: AppNavigator(onThemeChange: switchTheme), // Affiche l’écran principal avec navigation
    );
  }
}