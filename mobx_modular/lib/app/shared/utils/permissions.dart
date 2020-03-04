import 'package:permission_handler/permission_handler.dart';

_requestPermission(PermissionGroup permissionGroup) async {
  PermissionStatus status = await PermissionHandler().checkPermissionStatus(permissionGroup);
  if (status != PermissionStatus.granted) {
    Map<PermissionGroup, PermissionStatus> permissions =
      await PermissionHandler().requestPermissions([permissionGroup]);
    for (var permission in permissions.values)
      if (permission != PermissionStatus.granted)
        return false;
  }
  return true;
}

requestPermissionLocation() async {
  return await _requestPermission(PermissionGroup.location);
}