import 'package:dio/dio.dart';
import 'package:gym_app/app/config/constants.dart';

class NetworkHelper {
  Dio getDioClient() {
    return Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<Response> getRequest(
    String path, {
    final contentType,
    CancelToken cancelToken,
  }) async {
    Dio dio = getDioClient();
    Options options = Options(headers: contentType, responseType: ResponseType.json);
    try {
      return await dio.get(
        path,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      return Response(
        data: {'status': e.error, 'message': e.message},
        statusCode: e.response?.statusCode,
        requestOptions: e.requestOptions,
      );
    }
  }

  Future<Response> postRequest(
    String path, {
    dynamic data,
    dynamic contentType,
    CancelToken cancelToken,
  }) async {
    Dio dio = getDioClient();
    Options options = Options(headers: contentType, responseType: ResponseType.json);
    try {
      return await dio.post(
        path,
        data: data,
        options: options,
        cancelToken: cancelToken,
      );
    } on DioError catch (e) {
      if(e.message.contains('SocketException')) {
        return Response(
          data: {'status': e.error, 'message': 'No internet connection.'},
          statusCode: e.response?.statusCode,
          requestOptions: e.requestOptions,
        );
      }
      return Response(
        data: {'status': e.error, 'message': e.message},
        statusCode: e.response?.statusCode,
        requestOptions: e.requestOptions,
      );
    }
  }

}
