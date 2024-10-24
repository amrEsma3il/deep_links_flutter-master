package dev.flutter.deep_links_flutter

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Bundle
import android.util.Log

import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    private val CHANNEL = "poc.deeplink.flutter.dev/channel"
    private val EVENTS = "poc.deeplink.flutter.dev/events"
    private var screenParam: String? = null
    private var linksReceiver: BroadcastReceiver? = null

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor, CHANNEL).setMethodCallHandler { call, result ->
            if (call.method == "initialLink") {
                if (screenParam != null) {
                    result.success(screenParam)
                }
            }
        }

        EventChannel(flutterEngine.dartExecutor, EVENTS).setStreamHandler(
            object : EventChannel.StreamHandler {
                override fun onListen(args: Any?, events: EventChannel.EventSink) {
                    linksReceiver = createChangeReceiver(events)
                }

                override fun onCancel(args: Any?) {
                    linksReceiver = null
                }
            }
        )
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        val intent = getIntent()
        screenParam = intent.data?.getQueryParameter("screen")
    }

 override fun onNewIntent(intent: Intent) {
    super.onNewIntent(intent)
    if (intent.action == Intent.ACTION_VIEW) {
        val data = intent.data
        if (data != null) {
            val screen = data.getQueryParameter("screen")
            
            // Add this log to print the screen parameter in Logcat
            Log.d("DeepLink", "Screen parameter: $screen")
            
            if (screen != null) {
                // Passing the screen value to Flutter using the MethodChannel
                val flutterChannel = MethodChannel(flutterEngine!!.dartExecutor.binaryMessenger, "poc.deeplink.flutter.dev/channel")
                flutterChannel.invokeMethod("navigateTo", screen)
            }
        }
    }
}



    private fun createChangeReceiver(events: EventChannel.EventSink): BroadcastReceiver? {
        return object : BroadcastReceiver() {
            override fun onReceive(context: Context, intent: Intent) {
                val screen = intent.data?.getQueryParameter("screen")
                if (screen != null) {
                    events.success(screen)
                } else {
                    events.error("UNAVAILABLE", "Link unavailable", null)
                }
            }
        }
    }
}
