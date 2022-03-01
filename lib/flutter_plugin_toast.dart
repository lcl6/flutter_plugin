
import 'dart:async';

import 'package:flutter/services.dart';


typedef void TextViewCallBack(FlutterPluginToast controller);
class FlutterPluginToast {
  static const MethodChannel _channel = MethodChannel('flutter_plugin_toast');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<String> showToast() async{
     String toast =  await _channel.invokeMethod("showToast");
     return toast;

  }



}
