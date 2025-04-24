import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qtec/app/modules/home/controller/product_controller.dart';
import 'package:qtec/app/modules/home/model/products_response/product_response.dart';
import 'package:qtec/app/modules/search/controller/search_product_controller/search_product_controller.dart';
import 'package:qtec/app/modules/search/model/search_response/search_response.dart';

final productProvider =
    StateNotifierProvider<ProductController, AsyncValue<ProductsResponse>>(
      (ref) => ProductController(),
    );

final searchProvider =
    StateNotifierProvider<SearchProductController, AsyncValue<SearchResponse>>(
      (ref) => SearchProductController(),
    );
