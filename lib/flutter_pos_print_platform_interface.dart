import 'dart:typed_data';

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
    throw UnimplementedError('requestPermissions() has not been implemented.');
  }

  Future<bool?> connectBT(String address) {
    throw UnimplementedError('requestPermissions() has not been implemented.');
  }

  Future<bool?> autoConnectBT(String address) {
    throw UnimplementedError('requestPermissions() has not been implemented.');
  }

  Future<Uint8List?> generateQrCode(String data) {
    throw UnimplementedError('requestPermissions() has not been implemented.');
  }

  Future<bool?> printTestInvoice(
    bool isEnLang,
    String heading,
    String subHeading,
    String date,
    String time,
    String supportEmail,
    String supportPhone,
  ) {
    throw UnimplementedError('requestPermissions() has not been implemented.');
  }

  Future<bool?> printInvoice(
    bool isEnLang,
    bool qrEnable,
    String date,
    String time,
    String store,
    String cardName,
    String redeemCode,
    String serialNumber,
    String instructions,
    String supportEmail,
    String supportPhone,
    String advertiseText,
    String logo,
  ) {
    throw UnimplementedError('requestPermissions() has not been implemented.');
  }

  Future<bool?> printCompanyInvoice(
    bool isEnLang,
    String voucherCode,
    String id,
    String date,
    String time,
    String store,
    String companyName,
    String companyNumber,
    String amount,
    String supportEmail,
    String supportPhone,
  ) {
    throw UnimplementedError('requestPermissions() has not been implemented.');
  }

  Future<bool?> printDailyReport(
    bool isEnLang,
    String fromDate,
    String toDate,
    String store,
    List<Map<String, dynamic>> reportData,
    String totalCard,
    String totalQuantity,
    String totalAmount,
    String totalProfit,
    String date,
    String time,
    String supportEmail,
    String supportPhone,
  ) {
    throw UnimplementedError('requestPermissions() has not been implemented.');
  }
}
