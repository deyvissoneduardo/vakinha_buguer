import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/modules/home/home_bindings.dart';
import 'package:vakinha_burguer_mobile/app/modules/home/home_page.dart';

class HomeRouters {
  HomeRouters._();
  static const HOME_PAGE = '/home';

  static final routers = <GetPage>[
    GetPage(
      name: HOME_PAGE,
      page: () => const HomePage(),
      binding: HomeBindings(),
    )
  ];
}
