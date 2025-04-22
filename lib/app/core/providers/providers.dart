import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qtec/app/modules/home/controller/product_controller.dart';
import 'package:qtec/app/modules/home/model/products_response/product_response.dart';

final productProvider = StateNotifierProvider<ProductController, AsyncValue<ProductsResponse>>(
    (ref) => ProductController()
);