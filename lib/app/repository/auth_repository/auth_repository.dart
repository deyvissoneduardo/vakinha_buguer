import 'dart:developer';

import 'package:vakinha_burguer_mobile/app/core/execption/user_execption/user_notfound_execption.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client_execption.dart';
import 'package:vakinha_burguer_mobile/app/models/user_model.dart';

import './i_auth_repository.dart';

class AuthRepositoryImpl implements IAuthRepository {
  final RestClient _restClient;

  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;

  @override
  Future<UserModel> register(String name, String email, String password) async {
    final result = await _restClient.post(
      '/auth/register',
      {
        'name': name,
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      var message = 'Error ao registrar';
      if (result.statusCode == 400) {
        message = result.body['error'];
      }
      log(message, error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientExecption(message);
    }

    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post(
      '/auth/',
      {
        'email': email,
        'password': password,
      },
    );

    if (result.hasError) {
      if (result.statusCode == 403) {
        log(
          'usuario ou senha invalido',
          error: result.statusText,
          stackTrace: StackTrace.current,
        );
        throw UserNotFoundExecption();
      }
      log(
        'error ao lohar',
        error: result.statusText,
        stackTrace: StackTrace.current,
      );
      throw RestClientExecption('error ao lohar');
    }

    return UserModel.fromMap(result.body);
  }
}
