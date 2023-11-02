import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:programming_stars/src/constant/app_constant.dart';

class UserRepository {
  Future<void> signUp(
      {required String firstName,
      required String lastName,
      required String email,
      required String password,
      required String confirmPassword}) async {
    final response = await http.post(
      Uri.parse(AppConstant.SIGN_UP_URL),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: {
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "password": password,
        "confirmPassword": confirmPassword
      },
    );
    if (response.statusCode == 200) {
      debugPrint(response.body);
    } else {
      throw Exception('Failed to create user.');
    }
  }
}
