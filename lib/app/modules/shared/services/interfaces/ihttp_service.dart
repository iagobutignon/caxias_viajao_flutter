import 'package:dio/dio.dart';

abstract class IHttpService {
  Future<Response> post<T extends Object?>(String url, dynamic data);
}