import android.content.Context
import com.example.flutter_plugin_toast.MyEditext
import io.flutter.plugin.common.BinaryMessenger
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformViewFactory


public class MyFactory(private val messenger: BinaryMessenger): PlatformViewFactory(StandardMessageCodec.INSTANCE){



    override fun create(context: Context?, viewId: Int, args: Any?): PlatformView? {
        val hashMap = args as HashMap<String, Any>
        return context?.let { MyEditext(it,messenger,viewId,hashMap) }
    }

}