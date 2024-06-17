import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_pos_print/flutter_pos_print.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';
  final _flutterPosPrintPlugin = FlutterPosPrint();
  int connected = 0;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    String platformVersion;
    try {
      platformVersion = await _flutterPosPrintPlugin.getPlatformVersion() ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }
    if (!mounted) return;
    setState(() {
      _platformVersion = platformVersion;
    });
  }

  connect() async {
    print("connect");
    setState(() {
      connected = 1;
    });
    var success = await _flutterPosPrintPlugin.connectBT("00:11:22:33:44:55");
    print("success $success");
    setState(() {
      connected = 2;
    });
  }

  printer() {
    _flutterPosPrintPlugin.printInvoice(
        true,
        false,
        "12-12-24",
        "10:05PM",
        "EST",
        "Libyana",
        "1234565432345",
        "434343",
        "",
        "abcd@test.com",
        "+98765432",
        "20% OFF",
        "");
  }

  @override
  Widget build(BuildContext context) {
    String text = connected == 0
        ? "Connect"
        : connected == 1
            ? "Connecting"
            : "Connected";

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              ElevatedButton(onPressed: () {
                Permission.bluetoothConnect.request();
              }, child: Text("Permission")),
              ElevatedButton(
                  onPressed: () {
                    print("connect printed");
                    connect();
                  },
                  child: Text(text)),
              ElevatedButton(onPressed: printer, child: Text("Print"))
            ],
          ),
        ),
      ),
    );
  }
}
