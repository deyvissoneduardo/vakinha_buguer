import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/vakinha_ui.dart';
import 'package:vakinha_burguer_mobile/app/routes/splash_routers.dart';

void main() {
  runApp(const VakinhaBuguerApp());
}

class VakinhaBuguerApp extends StatelessWidget {
  const VakinhaBuguerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Vakinha Burguer',
      theme: VakinhaUI.theme,
      getPages: [
        ...SplashRouters.routers,
      ],
    );
  }
}
