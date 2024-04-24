
import 'package:envied/envied.dart';

part "env.g.dart";

// dart run build_runner build

@Envied(path: 'private_data.env')
abstract class Env{
  @EnviedField(varName: "APP_NAME", obfuscate: true)
  static final String appName = _Env.appName;
}