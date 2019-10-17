import 'dart:io';

import 'package:dio/dio.dart';

class ApiRequest {
  static Future<Response> request(
    String url,
    HttpMethods method, {
    Map param,
  }) async {
    Future<Response> _response;
    final _dio = Dio();
    switch (method) {
      case HttpMethods.POST:
        _response = _dio.post(url, data: param);
        break;
      case HttpMethods.GET:
        _response = _dio.get(url, queryParameters: param);
        break;
      case HttpMethods.PUT:
        _response = _dio.put(url, data: param);
        break;
      case HttpMethods.DELETE:
        _response = _dio.delete(url, data: param);
        break;
    }
    return _response
        .whenComplete(() => _response)
        .catchError((error) => throw 'Local Error: $error');
  }

  static Future<Response> _sendSingleFile(String text, File file) async {
    Dio dio = new Dio();
    FormData formdata = new FormData.fromMap({
      'text': text,
      'user_audio_file':
          await MultipartFile.fromFile(file.path, filename: 'voice_record'),
      'question_info': 'u1/q1'
    }); // just like JS
    return await dio
        .post(API.BASE_URL,
            data: formdata,
            options: Options(
                method: 'POST',
                responseType: ResponseType.json // or ResponseType.JSON
                ))
        .catchError((error) => print(error));
  }
}

enum HttpMethods { POST, GET, PUT, DELETE }

class API {
  static final String _API_KEY = '';
  static final String _USER_KEY = 'XYZ-ABC-99001';
  static final String BASE_URL =
      'https://api.speechace.co/api/scoring/text/v0.2/json?key=$_API_KEY&dialect=en-us&user_id=$_USER_KEY';
}
