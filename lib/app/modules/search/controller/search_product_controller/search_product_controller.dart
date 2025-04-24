import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qtec/app/modules/search/model/search_response/search_response.dart';
import 'package:qtec/app/modules/search/repository/search_repository/search_repository.dart';

class SearchProductController extends StateNotifier<AsyncValue<SearchResponse>> {
  SearchProductController() : super(const AsyncValue.loading()) {}

  final TextEditingController searchController = TextEditingController();

  Future<void> searchProduct(String search) async {
    try{
      var response = await SearchRepository().searchProducts(search);
      if(response.statusCode == 200){
        final data = SearchResponse.fromJson(response.data);
        state = AsyncValue.data(data);
      }

    }catch(e){
      rethrow;
    }

  }
}
