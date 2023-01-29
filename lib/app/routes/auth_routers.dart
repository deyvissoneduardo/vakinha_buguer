import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/login/login_page.dart';
import 'package:vakinha_burguer_mobile/app/modules/auth/register/register_page.dart';

class AuthRouters {
  AuthRouters._();
  static const LOGIN_PAGE = '/auth/login';
  static const REGISTER_PAGE = '/auth/regiter';

  static final routers = <GetPage>[
    GetPage(
      name: LOGIN_PAGE,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: REGISTER_PAGE,
      page: () => const RegisterPage(),
    )
  ];
}
