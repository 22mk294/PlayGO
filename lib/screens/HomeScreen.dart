import 'package:flutter/material.dart';
import '../components/MediaAddButton.dart';
import '../components/HeaderBar.dart';
import '../components/AudioListView.dart';

// Enumération des critères de tri
enum SortCriteria { date, name, length }

// Enumération des ordres de tri
enum SortOrder { newestFirst, oldestFirst }

class HomeScreen extends StatefulWidget {
  final String searchQuery;
  final void Function(String) onSearchChanged;

  const HomeScreen({
    super.key,
    required this.searchQuery,
    required this.onSearchChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  SortCriteria _selectedCriteria = SortCriteria.date;
  SortOrder _selectedOrder = SortOrder.newestFirst;

  void _showSortOptionsDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Trier les contenus"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                  _showSortOptionsDialog();
                },
              )),
              const Divider(),
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
        child: HeaderBar(
          title: "Playgo",
          onSearchChanged: widget.onSearchChanged,
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Audio',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: const Icon(Icons.sort),
                  onPressed: _showSortOptionsDialog,
                  tooltip: "Trier",
                ),
              ],
            ),
          ),
          AudioListView(query: widget.searchQuery),
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 64.0), // Décalé du bottom bar
        child: Align(
          alignment: Alignment.bottomRight,
          child: MediaAddButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Action Ajouter déclenchée")),
              );
            },
          ),
        ),
      ),
    );
  }
}
