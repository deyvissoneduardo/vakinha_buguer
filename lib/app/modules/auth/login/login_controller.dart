import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/core/constants.dart';
import 'package:vakinha_burguer_mobile/app/core/execption/user_execption/user_notfound_execption.dart';
import 'package:vakinha_burguer_mobile/app/core/mixin/loader_mixin.dart';
import 'package:vakinha_burguer_mobile/app/core/mixin/message_mixin.dart';
import 'package:vakinha_burguer_mobile/app/repository/auth_repository/i_auth_repository.dart';

class LoginController extends GetxController with LoaderMixin, MessageMixin {
  final IAuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  LoginController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loadListener(_loading);
    messageListener(_message);
  }

  Future<void> login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.login(email, password);
      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);
      _loading.toggle();
    } on UserNotFoundExecption catch (e, s) {
      _loading.toggle();
      log('Login ou senha invaldo', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Error',
            message: 'Login ou senha invalido',
            type: MessageType.error),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Error Login', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Error', message: 'Error Login', type: MessageType.error),
      );
    }
  }
}
