import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:vakinha_burguer_mobile/app/core/ui/widgets/vakinha_appbar.dart';
import './home_controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: VakinhaAppbar(),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          onTap: (value) => controller.tabIndex = value,
          currentIndex: controller.tabIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.list), label: 'Produtos'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart), label: 'Carrinho'),
            BottomNavigationBarItem(
                icon: Icon(Icons.exit_to_app), label: 'Sair')
          ],
        );
      }),
      body: Navigator(
        initialRoute: '/menu',
        key: Get.nestedKey(HomeController.NAVIGATION_KEY),
        onGenerateRoute: controller.onGenerateRoute,
      ),
    );
  }
}
