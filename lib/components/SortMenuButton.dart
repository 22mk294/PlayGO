// Importation des outils UI de Flutter
import 'package:flutter/material.dart';

// Définition des critères de tri possibles
enum SortCriteria { date, name, length }

// Définition des ordres de tri possibles
enum SortOrder { newestFirst, oldestFirst }

// Bouton permettant d'ouvrir le menu de tri
class SortMenuButton extends StatelessWidget {
  final SortCriteria selectedCriteria; // Critère de tri actuel
  final SortOrder selectedOrder; // Ordre de tri actuel
  final Function(SortCriteria, SortOrder) onChanged; // Callback lorsque le tri est modifié

  // Constructeur du bouton
  const SortMenuButton({
    super.key,
    required this.selectedCriteria,
    required this.selectedOrder,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.sort), // Icône de tri
      onPressed: () => showModalBottomSheet( // Affichage du menu de tri
        context: context,
        builder: (_) => _SortSheet(
          selectedCriteria: selectedCriteria,
          selectedOrder: selectedOrder,
          onChanged: onChanged,
        ),
      ),
    );
  }
}

// Menu de tri affiché dans un BottomSheet
class _SortSheet extends StatefulWidget {
  final SortCriteria selectedCriteria; // Critère de tri sélectionné
  final SortOrder selectedOrder; // Ordre de tri sélectionné
  final Function(SortCriteria, SortOrder) onChanged; // Callback pour appliquer le tri

  // Constructeur
  const _SortSheet({
    required this.selectedCriteria,
    required this.selectedOrder,
    required this.onChanged,
  });

  @override
  State<_SortSheet> createState() => _SortSheetState();
}

// Gestion de l'état du menu de tri
class _SortSheetState extends State<_SortSheet> {
  late SortCriteria _criteria; // Stockage du critère sélectionné
  late SortOrder _order; // Stockage de l’ordre sélectionné

  @override
  void initState() {
    super.initState();
    _criteria = widget.selectedCriteria; // Initialisation du critère
    _order = widget.selectedOrder; // Initialisation de l'ordre
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisSize: MainAxisSize.min, // Ajustement automatique de la taille
        children: [
          // Section de choix du critère de tri
          const Text("Trier par", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8), // Espacement
          RadioListTile( // Option "Date"
            title: const Text("Date"),
            value: SortCriteria.date,
            groupValue: _criteria,
            onChanged: (val) => setState(() => _criteria = val!), // Mise à jour de l'état
          ),
          RadioListTile( // Option "Nom"
            title: const Text("Nom"),
            value: SortCriteria.name,
            groupValue: _criteria,
            onChanged: (val) => setState(() => _criteria = val!),
          ),
          RadioListTile( // Option "Longueur"
            title: const Text("Longueur"),
            value: SortCriteria.length,
            groupValue: _criteria,
            onChanged: (val) => setState(() => _criteria = val!),
          ),

          const Divider(height: 24), // Séparateur visuel

          // Section de choix de l’ordre de tri
          const Text("Ordre", style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          RadioListTile( // Option "Du nouveau à l'ancien"
            title: const Text("Du nouveau à l'ancien"),
            value: SortOrder.newestFirst,
            groupValue: _order,
            onChanged: (val) => setState(() => _order = val!),
          ),
          RadioListTile( // Option "De l'ancien au nouveau"
            title: const Text("De l'ancien au nouveau"),
            value: SortOrder.oldestFirst,
            groupValue: _order,
            onChanged: (val) => setState(() => _order = val!),
          ),

          const SizedBox(height: 12), // Espacement avant le bouton
          ElevatedButton(
            onPressed: () {
              widget.onChanged(_criteria, _order); // Appliquer les changements
              Navigator.pop(context); // Fermer le menu
            },
            child: const Text("Appliquer"),
          ),
        ],
      ),
    );
  }
}