import 'package:flutter_dotenv/flutter_dotenv.dart';

abstract class Const {
  static final String baseURL = dotenv.get('baseurl');
  static final String apikey = dotenv.get('apikey');

}