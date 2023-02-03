import 'dart:developer';

import 'package:get/get.dart';
import 'package:vakinha_burguer_mobile/app/core/mixin/loader_mixin.dart';
import 'package:vakinha_burguer_mobile/app/core/mixin/message_mixin.dart';
import 'package:vakinha_burguer_mobile/app/models/product_model.dart';
import 'package:vakinha_burguer_mobile/app/repository/products/products_repository.dart';

class MenuController extends GetxController with LoaderMixin, MessageMixin {
  final ProductsRepository _productsRepository;

  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  final menu = <ProductModel>[].obs;

  MenuController({required ProductsRepository productsRepository})
      : _productsRepository = productsRepository;

  @override
  void onInit() {
    super.onInit();
    loadListener(_loading);
    messageListener(_message);
  }

  @override
  Future<void> onReady() async {
    super.onReady();
    try {
      _loading.toggle();
      await findAllProducts();
      _loading.toggle();
    } on Exception catch (e) {
      _loading.toggle();
      log('Error ao busar produtos', error: e);
      _message(MessageModel(
          title: 'Error',
          message: 'Error ao buscar produto',
          type: MessageType.error));
    }
  }

  Future<void> findAllProducts() async {
    final products = await _productsRepository.findAll();
    menu.assignAll(products);
  }

  Future<void> refreshPage() async {
    try {
      await findAllProducts();
    } on Exception catch (e) {
      log('Error ao busar produtos', error: e);
      _message(MessageModel(
          title: 'Error',
          message: 'Error ao buscar produto',
          type: MessageType.error));
    }
  }
}
