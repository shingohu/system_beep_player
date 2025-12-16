package com.shingo.beep_sound

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import android.media.AudioManager
import android.media.ToneGenerator
import android.os.Handler

/** BeepSoundPlugin */
class BeepSoundPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private var handler: Handler = Handler()
    private var toneGeneratorMap: MutableMap<String, ToneGenerator> = mutableMapOf()


    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "system_beep_player")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method.equals("playSysSound")) {
            val soundId = call.argument<Int>("soundId") ?: ToneGenerator.TONE_PROP_BEEP
            val volume = call.argument<Int>("volume") ?: 100
            val durationMs = call.argument<Int>("duration") ?: 200
            val streamType = call.argument<Int>("streamType") ?: AudioManager.STREAM_MUSIC
            playSysSound(soundId, volume, durationMs, streamType)
            result.success(true);
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
        toneGeneratorMap.forEach { (_, toneGenerator) ->
            toneGenerator.release()
        }
        toneGeneratorMap.clear()
    }

    private fun playSysSound(soundId: Int, volume: Int, durationMs: Int, streamType: Int) {
        val key = "$soundId-$volume-$streamType"
        if (!toneGeneratorMap.containsKey(key)) {
            toneGeneratorMap[key] = ToneGenerator(streamType, volume)
        }
        toneGeneratorMap[key]?.startTone(soundId, durationMs)
    }


}


