import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:system_info/system_info_method_channel.dart';

void main() {
  MethodChannelSystemInfo platform = MethodChannelSystemInfo();
  const MethodChannel channel = MethodChannel('system_info');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformInfo(), '42');
  });
}
