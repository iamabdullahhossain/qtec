import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qtec/app/modules/home/model/products_response/product_response.dart';
import 'package:qtec/app/modules/home/repository/product_fetch_repository/product_fetch_repository.dart';

class ProductController extends StateNotifier<AsyncValue<ProductsResponse>> {
  ProductController() : super(const AsyncValue.loading()) {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      var response = await ProductFetchRepository().fetchProducts();
      if (response.statusCode == 200) {

        final productResponseModel = ProductsResponse.fromJson(response.data);
        state = AsyncValue.data(productResponseModel);
      }
    } catch (e) {
      rethrow;
    }
  }
}
