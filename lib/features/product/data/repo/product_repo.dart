// product_repo.dart
import 'package:ass_simple_ecommorce/core/api/dio_client.dart';
import 'package:ass_simple_ecommorce/core/api/list_api.dart';
import 'package:ass_simple_ecommorce/core/error/failure.dart';
import 'package:ass_simple_ecommorce/features/product/data/response/get_product_response.dart';
import 'package:dartz/dartz.dart';

class ProductRepo {
  final DioClient _client = DioClient();

  Future<Either<Failure, List<GetProductResponse>>> getProducts() async {
    final response = await _client.getRequest(
      ListAPI.getProducts,
      converter: (response) {
        final data = response as List<dynamic>;
        return data.map((item) => GetProductResponse.fromJson(item)).toList();
      },
    );
    return response;
  }
}
