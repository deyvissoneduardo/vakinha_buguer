import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get_storage/get_storage.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/routes/auth_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/home_routers.dart';
import 'package:vakinha_burguer_mobile/app/routes/splash_routers.dart';

import 'app/core/bindings/aplication_bindings.dart';

Future<void> main() async {
  await GetStorage.init();
  runApp(const VakinhaBuguerApp());
}

class VakinhaBuguerApp extends StatelessWidget {
  const VakinhaBuguerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burguer',
      theme: VakinhaUI.theme,
      initialBinding: AplicationBindings(),
      getPages: [
        ...SplashRouters.routers,
        ...AuthRouters.routers,
        ...HomeRouters.routers,
      ],
    );
  }
}
