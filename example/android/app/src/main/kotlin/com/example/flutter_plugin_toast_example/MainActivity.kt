package com.example.flutter_plugin_toast_example

import MyViewFlutterPlugin
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MyViewFlutterPlugin().registWith(flutterEngine)
    }
}
