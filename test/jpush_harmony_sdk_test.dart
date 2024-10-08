import 'package:flutter_test/flutter_test.dart';
import 'package:jpush_harmony_sdk/jpush_harmony_sdk.dart';
import 'package:jpush_harmony_sdk/jpush_harmony_sdk_platform_interface.dart';
import 'package:jpush_harmony_sdk/jpush_harmony_sdk_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockJpushHarmonySdkPlatform
    with MockPlatformInterfaceMixin
    implements JpushHarmonySdkPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final JpushHarmonySdkPlatform initialPlatform = JpushHarmonySdkPlatform.instance;

  test('$MethodChannelJpushHarmonySdk is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelJpushHarmonySdk>());
  });

  test('getPlatformVersion', () async {
    JpushHarmonySdk jpushHarmonySdkPlugin = JpushHarmonySdk();
    MockJpushHarmonySdkPlatform fakePlatform = MockJpushHarmonySdkPlatform();
    JpushHarmonySdkPlatform.instance = fakePlatform;

    expect(await jpushHarmonySdkPlugin.getPlatformVersion(), '42');
  });
}
