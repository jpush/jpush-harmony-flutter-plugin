import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:jpush_harmony_sdk/jpush_harmony_sdk_method_channel.dart';

void main() {
  MethodChannelJpushHarmonySdk platform = MethodChannelJpushHarmonySdk();
  const MethodChannel channel = MethodChannel('jpush_harmony_sdk');

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
    expect(await platform.getPlatformVersion(), '42');
  });
}
