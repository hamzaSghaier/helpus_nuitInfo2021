import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void enableFullScreen() async {
  debugPrint("enableFullScreen");
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    DeviceOrientation.portraitUp
  ]);
}

void disableFullScreen() async {
  debugPrint("disableFullScreen");
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}
