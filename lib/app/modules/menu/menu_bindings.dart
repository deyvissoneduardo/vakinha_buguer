import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/repository/products/i_products_repository.dart';
import 'package:vakinha_burguer_mobile/app/repository/products/products_repository.dart';
import './menu_controller.dart';

class MenuBindings implements Bindings {
    @override
    void dependencies() {
      Get.lazyPut<IProductsRepository>(() => ProductsRepository(restClient: Get.find()));
        Get.put(MenuController(productsRepository: Get.find<ProductsRepository>()));
    }
}