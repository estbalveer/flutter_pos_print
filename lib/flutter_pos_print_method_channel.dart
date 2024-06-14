import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'flutter_pos_print_platform_interface.dart';

/// An implementation of [FlutterPosPrintPlatform] that uses method channels.
class MethodChannelFlutterPosPrint extends FlutterPosPrintPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('flutter_pos_print');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool?> connectBT(String address) async {
    final isConnect = await methodChannel
        .invokeMethod<bool>('connectBT', {'address': address});
    return isConnect;
  }

  @override
  Future<bool?> autoConnectBT(String address) async {
    final isConnect = await methodChannel
        .invokeMethod<bool>('autoConnectBT', {'address': address});
    return isConnect;
  }

  @override
  Future<Uint8List?> generateQrCode(String data) async {
    final bytes = await methodChannel
        .invokeMethod<Uint8List>('generateQrCode', {'data': data});
    return bytes;
  }

  @override
  Future<bool?> printTestInvoice(
    bool isEnLang,
    String heading,
    String subHeading,
    String date,
    String time,
    String supportEmail,
    String supportPhone,
  ) async {
    final success = methodChannel.invokeMethod<bool>(
      'printTestInvoice',
      {
        'isEnLang': isEnLang,
        'heading': heading,
        'subHeading': subHeading,
        'date': date,
        'time': time,
        'supportEmail': supportEmail,
        'supportPhone': supportPhone
      },
    );

    return success;
  }

  @override
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
    final success = methodChannel.invokeMethod<bool>(
      'printInvoice',
      {
        'isEnLang': isEnLang,
        'qrEnable': qrEnable,
        'date': date,
        'time': time,
        'store': store,
        'cardName': cardName,
        'redeemCode': redeemCode,
        'serialNumber': serialNumber,
        'instructions': instructions,
        'supportEmail': supportEmail,
        'supportPhone': supportPhone,
        'advertiseText': advertiseText,
        'logo': logo,
      },
    );

    return success;
  }

  @override
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
  ) async {
    final success = await methodChannel.invokeMethod<bool>(
      'printCompanyInvoice',
      {
        'isEnLang': isEnLang,
        'voucherCode': voucherCode,
        'id': id,
        'date': date,
        'time': time,
        'store': store,
        'companyName': companyName,
        'companyNumber': companyNumber,
        'amount': amount,
        'supportEmail': supportEmail,
        'supportPhone': supportPhone
      },
    );

    return success;
  }

  @override
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
  ) async {
    final success = await methodChannel.invokeMethod<bool>(
      'printDailyReport',
      {
        'isEnLang': isEnLang,
        'fromDate': fromDate,
        'toDate': toDate,
        'store': store,
        'reportData': reportData,
        'totalCard': totalCard,
        'totalQuantity': totalQuantity,
        'totalAmount': totalAmount,
        'totalProfit': totalProfit,
        'date': date,
        'time': time,
        'supportEmail': supportEmail,
        'supportPhone': supportPhone,
      },
    );

    return success;
  }
}
