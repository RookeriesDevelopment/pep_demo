import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'rook_method_channel.dart';

abstract class RookPlatform extends PlatformInterface {
  RookPlatform() : super(token: _token);

  static final Object _token = Object();

  static RookPlatform _instance = MethodChannelRook();
  static RookPlatform get instance => _instance;

  static set instance(RookPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion();
}
