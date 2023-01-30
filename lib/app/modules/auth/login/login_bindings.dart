import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/repository/auth_repository/i_auth_repository.dart';
import '../../../repository/auth_repository/auth_repository.dart';
import './login_controller.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
     Get.lazyPut<IAuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find<RestClient>()),
    );
    Get.put(LoginController(authRepository: Get.find<IAuthRepository>()));
  }
}
