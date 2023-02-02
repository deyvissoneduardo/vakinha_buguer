import 'dart:developer';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/core/constants.dart';
import 'package:vakinha_burguer_mobile/app/core/mixin/loader_mixin.dart';
import 'package:vakinha_burguer_mobile/app/core/mixin/message_mixin.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client_execption.dart';
import 'package:vakinha_burguer_mobile/app/repository/auth_repository/i_auth_repository.dart';

class RegisterController extends GetxController with LoaderMixin, MessageMixin {
  final IAuthRepository _authRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();

  RegisterController({
    required IAuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loadListener(_loading);
    messageListener(_message);
  }

  Future<void> register({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.register(name, email, password);
      _loading.toggle();
      GetStorage().write(Constants.USER_KEY, userLogged.id);
    } on RestClientExecption catch (e, s) {
      _loading.toggle();
      log('error ao registra login', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Error',
        message: e.message,
        type: MessageType.error,
      ));
    } catch (e, s) {
      _loading.toggle();
      log('error ao registra usuario', error: e, stackTrace: s);
      _message(MessageModel(
        title: 'Error',
        message: 'error ao registra usuario',
        type: MessageType.error,
      ));
    }
  }
}
