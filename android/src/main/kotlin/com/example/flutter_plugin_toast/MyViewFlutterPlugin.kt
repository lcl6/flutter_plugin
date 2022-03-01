import io.flutter.embedding.engine.FlutterEngine

public class MyViewFlutterPlugin{
    final val NATIVIEW_ID="com.example.flutter_plugin_toast/MyEditext";


    fun registWith(flutterEngine: FlutterEngine){
        flutterEngine.platformViewsController.registry.registerViewFactory(NATIVIEW_ID,MyFactory(flutterEngine.dartExecutor.binaryMessenger))

    }
}