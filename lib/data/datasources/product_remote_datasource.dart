import 'package:dartz/dartz.dart';
import 'package:frontend_pos_jumbotea/data/datasources/auth_local_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:frontend_pos_jumbotea/data/models/response/product_response_model.dart';

import '../../core/constants/variables.dart';

class ProductRemoteDataSource {
  Future<Either<String, ProductResponseModel>> getProducts() async {
    final authData = await AuthLocalDataSource().getAuthData();
    final response = await http.get(
      Uri.parse('${Variables.baseUrl}/api/products'),
      headers: {
        'Authorization': 'Bearer ${authData.token}',
      },
    );

    if (response.statusCode == 200) {
      return right(ProductResponseModel.fromJson(response.body));
    } else {
      return left(response.body);
    }
  }
}
