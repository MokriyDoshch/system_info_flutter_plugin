import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:system_info/system_info.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformInfo = 'Unknown';
  final _systemInfoPlugin = SystemInfo();
  List<String> listInfoData = [];

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformInfo;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformInfo =
          await _systemInfoPlugin.getPlatformInfo() ?? 'Unknown platform version';
    } on PlatformException {
      platformInfo = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformInfo = platformInfo;
    });
  }

  @override
  Widget build(BuildContext context) {
    listInfoData.addAll(_platformInfo.split('\n').toList());
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Get info plugin'),
        ),
        body: Center(
          child: ListView.builder(

            itemCount: listInfoData.length,
            itemBuilder: (context,index) {
              return Container(
                color: index.isOdd ? Colors.lightGreenAccent : Colors.blueGrey,
                child: Text(listInfoData[index]),
              );
            },
          ),//Text('Running on: $_platformInfo\n'),
        ),
      ),
    );
  }
}
