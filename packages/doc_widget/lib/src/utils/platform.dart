import 'package:flutter/foundation.dart';

bool isMobile() {
  final isiOS = defaultTargetPlatform == TargetPlatform.iOS;
  final isAndroid = defaultTargetPlatform == TargetPlatform.android;
  return isAndroid || isiOS;
}
