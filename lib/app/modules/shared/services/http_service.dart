import 'package:dio/dio.dart';

import 'interfaces/ihttp_service.dart';

class HttpService implements IHttpService {
  final Dio _dio = Dio(
    BaseOptions(
      contentType: 'application/json',
      followRedirects: false,
      validateStatus: (status) => true,
    ),
  );

  @override
  Future<Response> post<T extends Object?>(String url, data) async {
    try {
      final response = await _dio.post(
        url,
        data: data,
      );

      return response;
    } catch (e) {
      rethrow;
    }
  }
}