import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_pos_print_method_channel.dart';

abstract class FlutterPosPrintPlatform extends PlatformInterface {
  /// Constructs a FlutterPosPrintPlatform.
  FlutterPosPrintPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterPosPrintPlatform _instance = MethodChannelFlutterPosPrint();

  /// The default instance of [FlutterPosPrintPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterPosPrint].
  static FlutterPosPrintPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterPosPrintPlatform] when
  /// they register themselves.
  static set instance(FlutterPosPrintPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    return instance.getPlatformVersion();
  }
}
