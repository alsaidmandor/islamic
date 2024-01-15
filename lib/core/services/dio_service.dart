import 'package:dio/dio.dart';

import '../utils/app_strings.dart';

class DioService {
  late Dio dio;

  DioService() {
    BaseOptions options = BaseOptions(
      baseUrl: AppStrings.baseUrl,
      receiveDataWhenStatusError: true,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
    );
    dio = Dio(options);
  }
}
