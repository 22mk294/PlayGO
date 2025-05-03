// Importation des bibliothèques nécessaires
import 'package:flutter/material.dart';
import 'CustomSearchBar.dart'; // Importation d'un widget personnalisé

// Définition d'un widget stateless (sans état)
class HeaderBar extends StatelessWidget {
  // Déclaration des propriétés
  final String title; // Le titre affiché dans la barre
  final void Function(String)? onSearchChanged; // Fonction de rappel lors de la modification de recherche

  // Constructeur de la classe HeaderBar
  const HeaderBar({
    required this.title, // Le titre est obligatoire
    this.onSearchChanged, // La fonction est facultative
    super.key, // Clé unique du widget
  });

  // Définition de l'interface du widget
  @override
  Widget build(BuildContext context) {
    return CustomSearchBar( // Utilisation du widget CustomSearchBar
      title: title, // Passer le titre à CustomSearchBar
      onSearchChanged: onSearchChanged, // Passer la fonction de mise à jour de recherche
    );
  }
}