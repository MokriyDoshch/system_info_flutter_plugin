
import 'system_info_platform_interface.dart';

class SystemInfo {
  Future<String?> getPlatformInfo() {
    return SystemInfoPlatform.instance.getPlatformInfo();
  }
}
