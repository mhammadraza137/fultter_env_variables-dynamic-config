import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

// first define <key>DART_DEFINES</key> in info.plist and then run the command
// flutter run --dart-define-from-file private_data.env
// so values can be accessed in native side from this file "private_data.env"
  let dartDefinesString = Bundle.main.infoDictionary!["DART_DEFINES"] as! String
  var dartDefinesDictionary = [String:String]()
  for definedValue in dartDefinesString.components(separatedBy: ",") {
      let decoded = String(data: Data(base64Encoded: definedValue)!, encoding: .utf8)!
      let values = decoded.components(separatedBy: "=")
      dartDefinesDictionary[values[0]] = values[1]
  }

// for method channel
  let controller : FlutterViewController = window?.rootViewController as! FlutterViewController
      let appNameChannel = FlutterMethodChannel(name: "app_config",
                                                binaryMessenger: controller.binaryMessenger)
      appNameChannel.setMethodCallHandler({
        (call: FlutterMethodCall, result: @escaping FlutterResult) -> Void in
        if call.method == "getAppName" {
          result(dartDefinesDictionary["APP_NAME"] ?? "Not Found")
        } else {
          result(FlutterMethodNotImplemented)
        }
      })




    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
