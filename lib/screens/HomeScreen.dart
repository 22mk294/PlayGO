// Importation des outils UI et des composants de l'application
import 'package:flutter/material.dart';
import '../components/HeaderBar.dart'; // Barre d'application avec recherche
import '../components/AudioListView.dart'; // Liste des morceaux audio

// Enumération des critères de tri
enum SortCriteria { date, name, length }

// Enumération des ordres de tri
enum SortOrder { newestFirst, oldestFirst }

// Widget HomeScreen (écran principal avec recherche et tri)
class HomeScreen extends StatefulWidget {
  final String searchQuery; // Terme de recherche actif
  final void Function(String) onSearchChanged; // Callback de mise à jour de la recherche

  // Constructeur du widget
  const HomeScreen({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// Gestion de l'état du HomeScreen
class _HomeScreenState extends State<HomeScreen> {
  SortCriteria _selectedCriteria = SortCriteria.date; // Critère de tri par défaut
  SortOrder _selectedOrder = SortOrder.newestFirst; // Ordre de tri par défaut

  // Affichage de la boîte de dialogue de tri
  void _showSortOptionsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Trier les contenus"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Sélection du critère de tri
              ...SortCriteria.values.map((criteria) => RadioListTile<SortCriteria>(
                title: Text(criteria == SortCriteria.date
                    ? "Date"
                    : criteria == SortCriteria.name
                    ? "Nom"
                    : "Longueur"),
                value: criteria,
                groupValue: _selectedCriteria,
                onChanged: (value) {
                  setState(() => _selectedCriteria = value!);
                  Navigator.of(context).pop();
                  _showSortOptionsDialog(); // Garde la boîte ouverte pour choisir l'ordre ensuite
                },
              )),
              const Divider(), // Séparateur visuel
              // Sélection de l'ordre de tri
              ...SortOrder.values.map((order) => RadioListTile<SortOrder>(
                title: Text(order == SortOrder.newestFirst
                    ? "Du nouveau à l'ancien"
                    : "De l'ancien au nouveau"),
                value: order,
                groupValue: _selectedOrder,
                onChanged: (value) {
                  setState(() => _selectedOrder = value!);
                  Navigator.of(context).pop();
                },
              )),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: HeaderBar( // Utilisation du widget HeaderBar pour la barre de recherche
          title: "Playgo",
          onSearchChanged: widget.onSearchChanged,
        ),
      ),
      body: Column(
        children: [
          // Section "Audio" avec tri
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Audio',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton( // Bouton de tri
                  icon: const Icon(Icons.sort),
                  onPressed: _showSortOptionsDialog, // Ouvre la boîte de tri
                  tooltip: "Trier",
                )
              ],
            ),
          ),
          // Affichage de la liste des morceaux audio
          AudioListView(query: widget.searchQuery),
        ],
      ),
    );
  }
}