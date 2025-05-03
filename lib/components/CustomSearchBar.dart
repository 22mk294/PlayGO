// Importation des outils UI de Flutter
import 'package:flutter/material.dart';

// Définition d'un widget avec état (StatefulWidget)
class CustomSearchBar extends StatefulWidget {
  final String title; // Le titre affiché dans la barre
  final void Function(String)? onSearchChanged; // Fonction appelée lors d'un changement dans le champ de recherche

  // Constructeur du widget avec ses paramètres
  const CustomSearchBar({
    super.key,
    required this.title, // Titre obligatoire
    this.onSearchChanged, // Fonction facultative
  });

  // Création de l'état du widget
  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

// Définition de la classe d'état du widget
class _CustomSearchBarState extends State<CustomSearchBar> {
  bool _searchMode = false; // Booléen pour savoir si le mode recherche est activé
  final TextEditingController _controller = TextEditingController(); // Contrôleur pour gérer le texte saisi

  // Fonction pour basculer entre mode titre et mode recherche
  void _toggleSearch() {
    setState(() => _searchMode = !_searchMode); // Met à jour l'état
    if (!_searchMode) { // Si on quitte le mode recherche
      _controller.clear(); // Efface le texte saisi
      widget.onSearchChanged?.call(''); // Appelle la fonction avec une chaîne vide
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppBar( // Barre d'application
      title: AnimatedSwitcher( // Animation entre titre et champ de recherche
        duration: const Duration(milliseconds: 300), // Durée de l'animation
        child: _searchMode
            ? TextField( // Champ de recherche affiché si le mode est activé
          controller: _controller,
          autofocus: true,
          onChanged: widget.onSearchChanged, // Appelle la fonction en cas de changement
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: "Rechercher...",
            border: InputBorder.none,
          ),
        )
            : Align( // Affichage du titre si le mode recherche est désactivé
          alignment: Alignment.centerLeft,
          child: Text(widget.title, key: const ValueKey('title')),
        ),
      ),
      actions: [
        IconButton( // Bouton pour basculer entre recherche et affichage du titre
          icon: Icon(_searchMode ? Icons.close : Icons.search),
          onPressed: _toggleSearch, // Appelle la fonction toggle lors d'un appui
        ),
      ],
      backgroundColor: Theme.of(context).primaryColor, // Couleur du thème
      elevation: 0, // Supprime l’ombre sous la barre
    );
  }
}