import 'package:dartz/dartz.dart';
import 'package:frontend_pos_jumbotea/core/constants/variables.dart';
import 'package:frontend_pos_jumbotea/data/models/response/auth_response_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AuthRemoteDatasource {
  Future<Either<String, AuthResponseModel>> login(
    String email,
    String password,
  ) async {
    final response = await http.post(
      Uri.parse('${Variables.baseUrl}/api/login'),
      body: {
        'email': email,
        'password': password,
      },
    );
    if (response.statusCode == 200) {
      return right(AuthResponseModel.fromJson(jsonDecode(response.body)));
    } else {
      return left(response.body);
    }
  }
}