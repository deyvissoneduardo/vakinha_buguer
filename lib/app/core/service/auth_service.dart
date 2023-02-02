import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/core/constants.dart';
import 'package:vakinha_burguer_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/home_routers.dart';

class AuthService extends GetxService {
  final _isLogged = RxnBool();
  final _getStorage = GetStorage();

  void logoud() => _getStorage.write(Constants.USER_KEY, null);

  int? getUserId() => _getStorage.read(Constants.USER_KEY);

  Future<AuthService> init() async {
    _getStorage.listenKey(Constants.USER_KEY, (value) {
      _isLogged(value != null);
    });

    ever<bool?>(_isLogged, (isLogged){
      if(isLogged == null || !isLogged){
        Get.offAllNamed(HomeRouters.HOME_PAGE);
      }else{
        Get.offAllNamed(AuthRouters.LOGIN_PAGE);
      }
    });

    _isLogged(getUserId() != null);
    return this;
  }
}
