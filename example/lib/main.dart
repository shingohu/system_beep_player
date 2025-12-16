import 'dart:io';

import 'package:flutter/material.dart';
import 'package:system_beep_player/system_beep_player.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('System Beep Player')),

        body:
            Platform.isIOS
                ? ListView.builder(
                  itemCount: IOSSystemSoundID.values.length,
                  itemBuilder: (c, i) {
                    var item = IOSSystemSoundID.values[i];
                    return ListTile(
                      title: Text(item.name),
                      onTap: () {
                        SystemBeepPlayer.play(item.value);
                      },
                    );
                  },
                )
                : ListView.builder(
                  itemCount: AndroidSystemSoundID.values.length,
                  itemBuilder: (c, i) {
                    var item = AndroidSystemSoundID.values[i];
                    return ListTile(
                      title: Text(item.name),
                      onTap: () {
                        SystemBeepPlayer.play(item.value);
                      },
                    );
                  },
                ),
      ),
    );
  }
}
