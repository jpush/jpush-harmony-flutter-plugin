import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:jpush_harmony_sdk/jpush_harmony_sdk.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'jpush harmony sdk';
  String _RID = '';
  final _jpushHarmonySdkPlugin = JpushHarmonySdk();

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    String rid;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      _jpushHarmonySdkPlugin.setCallBack((eventName, data) async {
        print("flutter_log_MyApp:eventName:$eventName");
        print("flutter_log_MyApp:data:$data");

        setState(() {
          print("flutter_log_MyApp:setState");
          _platformVersion += "\n$eventName:$data";
          if(eventName == "onRegister"){
            _RID = data;
          }
        });
      });

      _jpushHarmonySdkPlugin.setDebug(true);
      _jpushHarmonySdkPlugin.setAppKey("b266cd5c8544ba09b23733e3");
      _jpushHarmonySdkPlugin.init();

      platformVersion = "";
      rid = await _jpushHarmonySdkPlugin.getRegistrationId()??"";
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
      rid = 'Failed rid.';
    }
    // _jpushHarmonySdkPlugin.setTags(10, ["a","b"]);
    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      print("111:setState");
      _RID = rid;
      _platformVersion += platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child:Column(
            children: [
              Container(
                // margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                // color: Colors.brown,
                child:  Text('RID: $_RID\n'),
              ),
              Container(
                // margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                // color: Colors.brown,
                child:  Text('Running on: $_platformVersion\n'),
              ),
            ],
          )
        ),
      ),
    );
  }
}
