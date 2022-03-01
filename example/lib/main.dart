import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_plugin_toast/flutter_plugin_toast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  String toastStr = "";

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    // We also handle the message potentially returning null.
    try {
      platformVersion = await FlutterPluginToast.platformVersion ??
          'Unknown platform version';
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Plugin example app'),
          ),
          body: Column(
            children: [
              Text('Running on: $_platformVersion\n'),
              GestureDetector(
                onTap: () async {
                  toastStr = await FlutterPluginToast.showToast();
                  setState(() {});
                },
                child: Text("点击显示Toast---$toastStr"),
              ),

              if (Platform.isAndroid)
                SizedBox(
                  width: double.infinity,
                  height: 100,
                  child:  AndroidView(
                  viewType: "com.example.flutter_plugin_toast/MyEditext",
                  onPlatformViewCreated: platFormCreate,
                  creationParams: const <String, dynamic>{
                    'title':"122123213",
                  },
                  //用来编码 creationParams 的形式，可选 [StandardMessageCodec], [JSONMessageCodec], [StringCodec], or [BinaryCodec]
                  creationParamsCodec:const StandardMessageCodec(),

                ),),

            ],
          )),
    );
  }

  Future<void> platFormCreate(int id) async {
    print("view创建成功回调---$id");
    var _channel = MethodChannel('com.example.flutter_plugin_toast/MyEditext_$id');
    _channel.invokeMethod("setText","哈哈");


  }
}
