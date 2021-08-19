import 'package:permission_handler/permission_handler.dart';

class PermissionHelper {
  PermissionHelper._privateConstructor();

  static var shared = PermissionHelper._privateConstructor();

  Future<bool> isPermissionGranted(Permission permission) async {
    var status = await permission.status;
    return status.isGranted;
  }

  Future<bool> requestPermission(Permission permission) async {
    if (await isPermissionGranted(permission)) {
      return true;
    }
    var isPermanentlyDenied = await permission.isPermanentlyDenied;
    if (isPermanentlyDenied) {
      await openAppSettings();
    } else {
      await permission.request();
    }
    return isPermissionGranted(permission);
  }
}
