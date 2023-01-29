import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:vakinha_burguer_mobile/app/modules/splash/splash_page.dart';

class SplashRouters {
  SplashRouters._();
  static const SPLASH_PAGE = '/';

  static final routers = <GetPage>[
    GetPage(name: SPLASH_PAGE, page: () => const SplashPage())
  ];
}
