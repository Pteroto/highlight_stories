import 'package:flutter/services.dart';

class Common {
  static const PLATFORM_CHANNEL =
      const MethodChannel('br.com.globosat.highlightstories/data');

  static void backToNative() {
    PLATFORM_CHANNEL.invokeMethod('backToNative');
  }
}
