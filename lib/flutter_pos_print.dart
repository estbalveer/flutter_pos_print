// You have generated a new plugin project without specifying the `--platforms`
// flag. A plugin project with no platform support was generated. To add a
// platform, run `flutter create -t plugin --platforms <platforms> .` under the
// same directory. You can also find a detailed instruction on how to add
// platforms in the `pubspec.yaml` at
// https://flutter.dev/docs/development/packages-and-plugins/developing-packages#plugin-platforms.

import 'dart:typed_data';

import 'flutter_pos_print_platform_interface.dart';

class FlutterPosPrint {
  static Future<String?> getPlatformVersion() {
    return FlutterPosPrintPlatform.instance.getPlatformVersion();
  }

  static Future<bool?> connectBT(String address) {
    return FlutterPosPrintPlatform.instance.connectBT(address);
  }

  static Future<bool?> autoConnectBT(String address) {
    return FlutterPosPrintPlatform.instance.autoConnectBT(address);
  }

  static Future<Uint8List?> generateQrCode(String data) {
    return FlutterPosPrintPlatform.instance.generateQrCode(data);
  }

  static Future<bool?> printTestInvoice(
    bool isEnLang,
    String heading,
    String subHeading,
    String date,
    String time,
    String supportEmail,
    String supportPhone,
  ) async {
    return FlutterPosPrintPlatform.instance.printTestInvoice(
      isEnLang,
      heading,
      subHeading,
      date,
      time,
      supportEmail,
      supportPhone,
    );
  }

  static Future<bool?> printInvoice(
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
    return FlutterPosPrintPlatform.instance.printInvoice(
        isEnLang,
        qrEnable,
        date,
        time,
        store,
        cardName,
        redeemCode,
        serialNumber,
        instructions,
        supportEmail,
        supportPhone,
        advertiseText,
        logo);
  }

  static Future<bool?> printCompanyInvoice(
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
    return FlutterPosPrintPlatform.instance.printCompanyInvoice(
      isEnLang,
      voucherCode,
      id,
      date,
      time,
      store,
      companyName,
      companyNumber,
      amount,
      supportEmail,
      supportPhone,
    );
  }

  static Future<bool?> printDailyReport(
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
    return FlutterPosPrintPlatform.instance.printDailyReport(
      isEnLang,
      fromDate,
      toDate,
      store,
      reportData,
      totalCard,
      totalQuantity,
      totalAmount,
      totalProfit,
      date,
      time,
      supportEmail,
      supportPhone,
    );
  }
}
