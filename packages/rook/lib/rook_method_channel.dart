import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'rook_platform_interface.dart';

class MethodChannelRook extends RookPlatform {
  @visibleForTesting
  final methodChannel = const MethodChannel('rook');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
