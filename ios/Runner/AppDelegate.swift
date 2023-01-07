import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    // [GMSServices provideAPIKey:@"AIzaSyC1o0VfZq4qsu4VgX8QnuMa89soNsphuDk"];
    GMSServices.provideAPIKey("AIzaSyC1o0VfZq4qsu4VgX8QnuMa89soNsphuDk")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
