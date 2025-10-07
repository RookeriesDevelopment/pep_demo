import 'package:flutter_test/flutter_test.dart';
import 'package:rook/rook.dart';
import 'package:rook/rook_platform_interface.dart';
import 'package:rook/rook_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockRookPlatform
    with MockPlatformInterfaceMixin
    implements RookPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final RookPlatform initialPlatform = RookPlatform.instance;

  test('$MethodChannelRook is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelRook>());
  });

  test('getPlatformVersion', () async {
    Rook rookPlugin = Rook();
    MockRookPlatform fakePlatform = MockRookPlatform();
    RookPlatform.instance = fakePlatform;

    expect(await rookPlugin.getPlatformVersion(), '42');
  });
}
