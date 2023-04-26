import Flutter
import UIKit

public class VoicevoxFlutterPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(
      name: "voicevox_flutter", binaryMessenger: registrar.messenger())
    let instance = VoicevoxFlutterPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "setModelPath":
      if let args = call.arguments as? [String: Any],
        let path = args["path"] as? String
      {
        setenv("VV_MODELS_ROOT_DIR", path, 1)
        result("Success")
      } else {
        result(FlutterError.init(code: "bad args", message: nil, details: nil))
      }
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
