import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Env/env.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  static const MethodChannel _channel = MethodChannel('app_config');

  static Future<String> get appName async {
    final String appName = await _channel.invokeMethod('getAppName');
    print("App Name from native ios is : $appName");
    return appName;
  }


  @override
  void initState() {
    super.initState();
    appName;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Envied'),),
        body: Center(
          child: Text('Env variable from dotenv :: ${Env.appName}'),
        ),
      ),
    );
  }
}
