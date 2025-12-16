import Flutter
import UIKit
import AudioToolbox

public class BeepSoundPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "system_beep_player", binaryMessenger: registrar.messenger())
    let instance = BeepSoundPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    if call.method == "playSysSound" {
      if let args = call.arguments as? [String: Any],
         let soundId = args["soundId"] as? UInt32 {
        playSysSound(soundId: soundId)
        result(true)
      } else {
        result(false)
      }
    } else {
      result(FlutterMethodNotImplemented)
    }
  }

  private func playSysSound(soundId: UInt32) {
    AudioServicesPlaySystemSound(soundId)
  }
}
