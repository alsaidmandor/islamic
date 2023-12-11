import 'package:dio/dio.dart';

import '../utils/app_strings.dart';

class DioService {
  late Dio dio;

  DioService() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    );
    dio = Dio(options);
  }
}
