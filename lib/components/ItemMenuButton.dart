// Importation des outils UI de Flutter
import 'package:flutter/material.dart';

// Définition d'un widget stateless (sans état)
class ItemMenuButton extends StatelessWidget {
  final VoidCallback onDelete; // Fonction appelée lors de la suppression

  // Constructeur du widget
  const ItemMenuButton({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>( // Menu contextuel au clic sur l'icône ⋮
      icon: const Icon(Icons.more_vert), // Icône du menu
      onSelected: (value) { // Action lorsqu'un élément est sélectionné
        if (value == 1) onDelete(); // Exécute la suppression si l’option est choisie
      },
      itemBuilder: (context) => [ // Liste des éléments du menu
        PopupMenuItem<int>( // Élément "Supprimer"
          value: 1, // Identifiant de l’option
          child: Row( // Affichage de l’icône + texte
            children: const [
              Icon(Icons.delete, color: Colors.red), // Icône de suppression rouge
              SizedBox(width: 8), // Espacement entre icône et texte
              Text("Supprimer"), // Libellé de l'option
            ],
          ),
        ),
      ],
    );
  }
}