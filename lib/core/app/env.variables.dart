// Package imports:
import 'package:flutter_dotenv/flutter_dotenv.dart';

enum EnvTypeEnum { dev, production }

class EnvVariable {
  EnvVariable._();

  static final instance = EnvVariable._();

  String _envType = '';
  bool get debugMode => _envType == 'dev';

  Future<void> init({required EnvTypeEnum envType}) async {
    switch (envType) {
      case EnvTypeEnum.dev:
        await dotenv.load(fileName: '.env.dev');
      case EnvTypeEnum.production:
        await dotenv.load(fileName: '.env.production');
    }
    _envType = dotenv.get('ENV_TYPE');
  }
}
