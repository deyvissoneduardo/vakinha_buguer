import 'dart:developer';

import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client.dart';
import 'package:vakinha_burguer_mobile/app/core/rest_client/rest_client_execption.dart';
import 'package:vakinha_burguer_mobile/app/models/product_model.dart';

import 'i_products_repository.dart';

class ProductsRepository implements IProductsRepository {
  final RestClient _restClient;

  ProductsRepository({required RestClient restClient}) : _restClient = restClient;

  @override
  Future<List<ProductModel>> findAll() async {
    final result = await _restClient.get('/products/');

    if (result.hasError) {
      log('Error ao buscar produtos ${result.statusCode}',
          error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientExecption('Error ao buscar produtos');
    }

    return result.body.map<ProductModel>((e) => ProductModel.fromMap(e)).toList();
  }
}
