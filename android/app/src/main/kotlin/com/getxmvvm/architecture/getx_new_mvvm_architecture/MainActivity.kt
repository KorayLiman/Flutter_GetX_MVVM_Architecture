package com.getxmvvm.architecture.getx_new_mvvm_architecture
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import androidx.annotation.NonNull

class MainActivity: FlutterActivity() {
    private val CHANNEL:String = "objectbox"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
                call, result ->
            if (call.method == "loadNativeObjectboxLibrary") {

                try {
                    System.loadLibrary("objectbox-jni")
                    result.success("ok")
                } catch (e: Throwable){
                    result.error("error on loading ${e.toString()}",null, null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
