import 'package:file_picker/file_picker.dart';
import 'dart:io';

class FileUtils {
  static Future<List<File>> pickMediaFiles() async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['mp3', 'mp4', 'wav', 'avi'],
    );

    if (result != null && result.files.isNotEmpty) {
      return result.paths.map((path) => File(path!)).toList();
    } else {
      return [];
    }
  }
}
