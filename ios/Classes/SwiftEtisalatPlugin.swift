import Flutter
import UIKit

public class SwiftEtisalatPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "com.etisalat", binaryMessenger: registrar.messenger())
    let instance = SwiftEtisalatPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if(call.method == "authorisation"){
          AuthorizationApi(data:call.arguments as! [String: String],result: result)
    
      } else if(call.method == "registration"){
          RegistrationApi(data:call.arguments as! [String: String],result: result)

          
      } else if(call.method == "finalization"){
          FinalizationApi(data:call.arguments as! [String: String],result: result)

      }
  }
    
}
