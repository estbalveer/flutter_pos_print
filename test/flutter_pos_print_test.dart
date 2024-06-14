import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_pos_print/flutter_pos_print.dart';
import 'package:flutter_pos_print/flutter_pos_print_platform_interface.dart';
import 'package:flutter_pos_print/flutter_pos_print_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterPosPrintPlatform
    with MockPlatformInterfaceMixin
    implements FlutterPosPrintPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final FlutterPosPrintPlatform initialPlatform = FlutterPosPrintPlatform.instance;

  test('$MethodChannelFlutterPosPrint is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelFlutterPosPrint>());
  });

  test('getPlatformVersion', () async {
    FlutterPosPrint flutterPosPrintPlugin = FlutterPosPrint();
    MockFlutterPosPrintPlatform fakePlatform = MockFlutterPosPrintPlatform();
    FlutterPosPrintPlatform.instance = fakePlatform;

    expect(await flutterPosPrintPlugin.getPlatformVersion(), '42');
  });
}
