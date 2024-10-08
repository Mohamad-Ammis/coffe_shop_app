import 'package:dio/dio.dart';

class ApiService {
  final Dio dio;

  ApiService({required this.dio});
  Future<Response> post(
      {required String url,
      required body,
      required token,
      contentType,
      Map<String, String>? headers}) async {
    var response = await dio.post(url,
        data: body,
        options: Options(
            contentType: contentType,
            headers: headers ??
                {
                  'Authorization': "Bearer $token",
                  // "Content-Type": 'application/x-www-form-urlencoded'
                }));
    return response;
  }
  Future<Response> get(
      {required String url,
      required token,
      contentType,
      Map<String, String>? headers}) async {
    var response = await dio.get(url,
        options: Options(
            contentType: contentType,
            headers: headers ??
                {
                  'Authorization': "Bearer $token",
                  // "Content-Type": 'application/x-www-form-urlencoded'
                }));
    return response;
  }
}
