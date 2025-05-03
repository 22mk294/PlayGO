import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import '../../features/home/logic/media_provider.dart';

class AddMediaButton extends StatelessWidget {
  const AddMediaButton({super.key, required void Function() onPressed});

  Future<void> _handleAddMedia(BuildContext context) async {
    // Demander la permission
    final hasPermission = await Permission.storage.request().isGranted;
    if (!hasPermission) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission refusée.')),
      );
      return;
    }

    // Ouvrir le sélecteur de fichiers
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['mp3', 'wav', 'aac', 'ogg', 'mp4', 'avi', 'mov', 'mkv'],
    );

    if (result != null && result.files.isNotEmpty) {
      final files = result.paths.map((path) => File(path!)).toList();
      // Ajouter les fichiers dans le provider
      context.read<MediaProvider>().addMediaFiles(files);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Contenu ajouté avec succès.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 80.0, right: 8.0),
      child: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () => _handleAddMedia(context),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
