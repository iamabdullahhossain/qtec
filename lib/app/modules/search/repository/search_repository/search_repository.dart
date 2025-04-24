import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:qtec/app/core/api_list/api_list.dart';

class SearchRepository {
  Future<Response> searchProducts(String search) async {
    var dio = Dio();
    dio.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: true,
        error: true,
        compact: true,
        maxWidth: 100,
      ),
    );

    try {
      var response = await dio.get(
        "${ApiList.searchProductApi}?q=$search&select=title,price,discountPercentage,rating,reviews,availabilityStatus,images,thumbnail",
      );
      if (response.statusCode == 200) {
        return response;
      }
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
