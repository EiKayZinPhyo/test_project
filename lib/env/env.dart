import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(obfuscate: true)
abstract class Env {
  @EnviedField(varName: 'API_DOMAIN', obfuscate: true)
  static String apiDomain = _Env.apiDomain;
}
