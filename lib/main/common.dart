import 'package:flutter/services.dart';

class Common {
  static const PLATFORM_CHANNEL =
      const MethodChannel('br.com.globosat.highlightstories/data');

  static void backToNative() {
    PLATFORM_CHANNEL.invokeMethod('backToNative');
  }

  static void setHandler() {
    PLATFORM_CHANNEL.setMethodCallHandler(close);
  }

  static Future<dynamic> close(MethodCall call) async {
    switch (call.method) {
      case 'closeFlutter':
        SystemNavigator.pop();
        break;
    }
  }
}
