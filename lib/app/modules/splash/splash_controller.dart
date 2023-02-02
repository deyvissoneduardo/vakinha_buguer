import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/service/auth_service.dart';

class SplashController extends GetxController {
  void checkLogged() {
    Get.putAsync(() => AuthService().init());
  }
}
