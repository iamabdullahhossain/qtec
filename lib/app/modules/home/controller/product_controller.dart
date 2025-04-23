import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qtec/app/modules/home/model/products_response/product_response.dart';
import 'package:qtec/app/modules/home/repository/product_fetch_repository/product_fetch_repository.dart';

class ProductController extends StateNotifier<AsyncValue<ProductsResponse>> {
  ProductController() : super(const AsyncValue.loading()) {
    fetchProducts();
  }

  int skip = 0;
  final int limit = 10;
  bool isLoadingMore = false;
  bool hasMore = true;

  Future<void> fetchProducts() async {
    try {
      var response = await ProductFetchRepository().fetchProducts(limit, skip);
      if (response.statusCode == 200) {
        final data = ProductsResponse.fromJson(response.data);
        skip += limit;
        hasMore = data.products!.length == limit;
        state = AsyncValue.data(data);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> loadMoreProducts() async {
    if (isLoadingMore || !hasMore) return;
    isLoadingMore = true;

    try{
      final response = await ProductFetchRepository().fetchProducts(limit, skip);
      if (response.statusCode == 200) {
        final newData = ProductsResponse.fromJson(response.data);
        skip += limit;
        hasMore = newData.products!.length == limit;

        final currentState = state.value;

        if (currentState != null) {
          final updatedProducts = [...?currentState.products, ...?newData.products];
          final updatedResponse = currentState.copyWith(
            products: updatedProducts,
            total: newData.total,
            skip: skip,
            limit: limit,
          );

          state = AsyncValue.data(updatedResponse);
        }
      }

    }catch(e, st){
      state = AsyncValue.error(e, st);
    }finally{
      isLoadingMore = false;
    }

  }
}
