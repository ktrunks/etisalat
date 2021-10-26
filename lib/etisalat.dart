import 'dart:async';

import 'package:flutter/services.dart';

class Etisalat {
  static const MethodChannel _channel = MethodChannel('etisalat');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Map<String, dynamic>?> get authorisation async {
    final Map<String, dynamic>? res =
        await _channel.invokeMethod('authorisation');
    return res;
  }

  static Future<Map<String, dynamic>?> get registration async {
    final Map<String, dynamic>? res =
        await _channel.invokeMethod('registration');
    return res;
  }

  static Future<Map<String, dynamic>?> get finalization async {
    final Map<String, dynamic>? res =
        await _channel.invokeMethod('finalization');
    return res;
  }
}
