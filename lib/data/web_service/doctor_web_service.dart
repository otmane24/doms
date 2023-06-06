import 'package:dio/dio.dart';

import '../../constants/strings/constants_strings.dart';

class DoctorWebService {
  Dio? dio;

  DoctorWebService() {
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
      headers: {
        'content-type': 'application/json',
      },
    );
    dio = Dio(options);
  }

  Future<dynamic> getDoctor() async {
    try {
      Response response = await dio!.get(
        '/Doctor',
      );
      print(response.data);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        return e.response!;
      } else {
        print('error ${e.error.toString()}');
        // Something happened in setting up or sending the request that triggered an Error
        return Response(requestOptions: RequestOptions(path: 'path'));
      }
    }
  }

  Future<dynamic> updateBooking({
    required String id,
  }) async {
    try {
      Response response = await dio!.post(
        '/driver/recharge',
        data: {
          "id": id,
        },
      );
      print(response.data);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response!.data);
        return e.response!;
      } else {
        print('error ${e.error.toString()}');
        // Something happened in setting up or sending the request that triggered an Error
        return Response(requestOptions: RequestOptions(path: 'path'));
      }
    }
  }
}
