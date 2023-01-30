import 'package:get/get.dart';

class RestClient extends GetConnect {
  final _url = 'https://dartweek.academiadoflutter.com.br';

  RestClient() {
    httpClient.baseUrl = _url;
  }
}
