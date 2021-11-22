import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:tokokita/helpers/app_exception.dart';
import 'package:tokokita/helpers/user_info.dart';

class Api {
  Future<dynamic> post(String url, dynamic data) async {
    var token = await UserInfo().getToken();
    var responseJson;

    try {
      final response = await http.post(Uri.parse(url),
          body: data,
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  Future<dynamic> get(String url) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.get(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      responseJson = _returnResponse(response);
    } catch (e) {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  Future<dynamic> delete(String url) async {
    var token = await UserInfo().getToken();
    var responseJson;
    try {
      final response = await http.delete(Uri.parse(url),
          headers: {HttpHeaders.authorizationHeader: 'Bearer $token'});
      responseJson = _returnResponse(response);
    } catch (e) {
      throw FetchDataException('No internet connection');
    }
    return responseJson;
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return response.body;

      case 400:
        throw BadRequestException(response.body.toString());

      case 401:
      case 403:
        return UnauthorisedException(response.body.toString());

      case 422:
        return InvalidInputException(response.body.toString());

      case 500:
        break;
      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
