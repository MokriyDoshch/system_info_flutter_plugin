import 'package:flutter_test/flutter_test.dart';
import 'package:system_info/system_info.dart';
import 'package:system_info/system_info_platform_interface.dart';
import 'package:system_info/system_info_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockSystemInfoPlatform
    with MockPlatformInterfaceMixin
    implements SystemInfoPlatform {

  @override
  Future<String?> getPlatformInfo() => Future.value('42');
}

void main() {
  final SystemInfoPlatform initialPlatform = SystemInfoPlatform.instance;

  test('$MethodChannelSystemInfo is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelSystemInfo>());
  });

  test('getPlatformVersion', () async {
    SystemInfo systemInfoPlugin = SystemInfo();
    MockSystemInfoPlatform fakePlatform = MockSystemInfoPlatform();
    SystemInfoPlatform.instance = fakePlatform;

    expect(await systemInfoPlugin.getPlatformInfo(), '42');
  });
}
