import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'system_info_method_channel.dart';

abstract class SystemInfoPlatform extends PlatformInterface {
  /// Constructs a SystemInfoPlatform.
  SystemInfoPlatform() : super(token: _token);

  static final Object _token = Object();

  static SystemInfoPlatform _instance = MethodChannelSystemInfo();

  /// The default instance of [SystemInfoPlatform] to use.
  ///
  /// Defaults to [MethodChannelSystemInfo].
  static SystemInfoPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [SystemInfoPlatform] when
  /// they register themselves.
  static set instance(SystemInfoPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformInfo() {
    throw UnimplementedError('platformInfo() has not been implemented.');
  }
}
