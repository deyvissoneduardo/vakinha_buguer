import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/repository/auth_repository/auth_repository.dart';
import 'package:vakinha_burguer_mobile/app/repository/auth_repository/i_auth_repository.dart';
import 'register_controller.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IAuthRepository>(
      () => AuthRepositoryImpl(restClient: Get.find<RestClient>()),
    );
    Get.put(RegisterController(authRepository: Get.find<IAuthRepository>()));
  }
}
