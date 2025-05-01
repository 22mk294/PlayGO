import '../../../core/utils/permission_service.dart';
import '../../../core/utils/file_utils.dart';
import 'dart:io';

class HomeController {
  Future<List<File>> addMediaFiles() async {
    bool hasPermission = await PermissionService.requestStoragePermission();
    if (!hasPermission) {
      throw Exception('Permission denied');
    }
    return await FileUtils.pickMediaFiles();
  }
}
