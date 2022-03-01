package com.example.flutter_plugin_toast

import android.annotation.SuppressLint
import android.content.Context
import android.util.Log
import android.view.View
import android.widget.EditText
import android.widget.TextView
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.platform.PlatformView


/**
 *Created by  on 2022/3/1.
 */

public class MyEditext : EditText, PlatformView, MethodChannel.MethodCallHandler{


    constructor(context: Context, messenger: BinaryMessenger, id:Int, params:Map<String,Any>) : super(context) {
        hint = "请输入100"
        Log.i("MyEditext","--参数-$id-----${params.toString()}");
        val methodChannel = MethodChannel(messenger, "com.example.flutter_plugin_toast/MyEditext_$id")
        methodChannel.setMethodCallHandler(this)

    }

    override fun getView(): View {

        return this
    }

    override fun dispose() {
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if("setText".equals(call.method)){
            val arguments = call.arguments
            this.setText(arguments.toString())
            result.success("绘制成功")
        }

    }

}