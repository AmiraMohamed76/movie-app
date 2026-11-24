import 'package:flutter_dotenv/flutter_dotenv.dart';

class EnvConfig {
  static final String apiKey = dotenv.env['API_KEY'] ?? '';
}