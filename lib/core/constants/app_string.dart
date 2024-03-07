import 'package:flutter_dotenv/flutter_dotenv.dart';

class AppString {
  AppString._();
  static String apiKey = dotenv.env['API_KEY'] ?? "";
  static const googleApiUrl = "maps.googleapis.com";
}
