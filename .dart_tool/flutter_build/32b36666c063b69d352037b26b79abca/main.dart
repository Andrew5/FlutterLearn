// @dart=2.12
// Flutter web bootstrap script for file:///Volumes/%E6%9C%AA%E5%91%BD%E5%90%8D/%E5%87%AF%E5%93%A5%E6%95%B0%E6%8D%AE%E6%81%A2%E5%A4%8D15011266657/15201503585%E5%9B%BA%E6%80%81%E6%95%B0%E6%8D%AE/UseCode/Project/OC/zkty/customer/FlutterDemo/flutter_application_1/test/02_Dart%E4%B8%AD%E5%BA%93%E7%9A%84%E4%BD%BF%E7%94%A8/02_use_customer_libary.dart.
//
// Generated file. Do not edit.
//

// ignore_for_file: type=lint

import 'dart:ui' as ui;
import 'dart:async';

import 'file:///Volumes/%E6%9C%AA%E5%91%BD%E5%90%8D/%E5%87%AF%E5%93%A5%E6%95%B0%E6%8D%AE%E6%81%A2%E5%A4%8D15011266657/15201503585%E5%9B%BA%E6%80%81%E6%95%B0%E6%8D%AE/UseCode/Project/OC/zkty/customer/FlutterDemo/flutter_application_1/test/02_Dart%E4%B8%AD%E5%BA%93%E7%9A%84%E4%BD%BF%E7%94%A8/02_use_customer_libary.dart' as entrypoint;
import 'web_plugin_registrant.dart' as pluginRegistrant;

typedef _UnaryFunction = dynamic Function(List<String> args);
typedef _NullaryFunction = dynamic Function();

Future<void> main() async {
  await ui.webOnlyWarmupEngine(
    runApp: () {
      if (entrypoint.main is _UnaryFunction) {
        return (entrypoint.main as _UnaryFunction)(<String>[]);
      }
      return (entrypoint.main as _NullaryFunction)();
    },
    registerPlugins: () {
      pluginRegistrant.registerPlugins();
    },
  );
}