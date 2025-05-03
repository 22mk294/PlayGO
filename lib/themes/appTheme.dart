// Importation des outils UI de Flutter
import 'package:flutter/material.dart';

// Classe contenant les thèmes personnalisés de l'application
class AppThemes {
  // Thème bleu (sombre)
  static final ThemeData blueTheme = ThemeData(
    scaffoldBackgroundColor: const Color(0xFF0057A3), // Fond bleu foncé
    primaryColor: Colors.blue, // Couleur principale bleue
    brightness: Brightness.dark, // Activation du mode sombre
    iconTheme: const IconThemeData(color: Colors.white), // Icônes blanches
    textTheme: const TextTheme( // Couleurs du texte
      bodyLarge: TextStyle(color: Colors.white), // Texte principal blanc
      bodyMedium: TextStyle(color: Colors.white70), // Texte secondaire blanc légèrement opaque
    ),
  );

  // Thème sombre (fond noir)
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.black, // Fond noir
    primaryColor: Colors.grey[900], // Couleur principale gris foncé
    brightness: Brightness.dark, // Mode sombre activé
    iconTheme: const IconThemeData(color: Colors.white), // Icônes blanches
    textTheme: const TextTheme( // Couleurs du texte
      bodyLarge: TextStyle(color: Colors.white), // Texte principal blanc
      bodyMedium: TextStyle(color: Colors.white70), // Texte secondaire blanc légèrement opaque
    ),
  );

  // Thème clair (fond blanc)
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white, // Fond blanc
    primaryColor: Colors.white, // Couleur principale blanche
    brightness: Brightness.light, // Mode clair activé
    appBarTheme: const AppBarTheme( // Personnalisation de la barre d'application
      backgroundColor: Colors.white, // Barre blanche
      foregroundColor: Colors.black, // Texte noir
      elevation: 0, // Suppression de l’ombre sous la barre
    ),
    iconTheme: const IconThemeData(color: Colors.black), // Icônes noires
    textTheme: const TextTheme( // Couleurs du texte
      bodyLarge: TextStyle(color: Colors.black), // Texte principal noir
      bodyMedium: TextStyle(color: Colors.black54), // Texte secondaire gris clair
    ),
  );
}