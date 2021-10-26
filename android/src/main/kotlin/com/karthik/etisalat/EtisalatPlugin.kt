package com.karthik.etisalat

import androidx.annotation.NonNull
import com.karthik.etisalat.api.AuthorizationApiCall
import com.karthik.etisalat.api.FinalizationApiCall
import com.karthik.etisalat.api.RegistrationApiCall
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.util.*

/** EtisalatPlugin */
class EtisalatPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    private var baseUrl = "http://ipg.comtrust.ae.2443";

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "com.etisalat")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "authorisation" -> {
                val arg: Map<String, Objects> = call.arguments()
                AuthorizationApiCall().api(arg, result)

            }
            "registration" -> {
                val arg: Map<String, Objects> = call.arguments()
                RegistrationApiCall().api(arg, result)

            }
            "finalization" -> {
                val arg: Map<String, Objects> = call.arguments()
                FinalizationApiCall().api(arg, result)

            }
            else -> {
                result.notImplemented()
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun authorizationApiCall(arg: Map<String, Objects>, result: Result) {

    }
}
