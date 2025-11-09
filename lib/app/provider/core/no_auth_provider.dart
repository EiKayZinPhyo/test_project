import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_project/env/env.dart';

final noAuthDioProvider = Provider((ref) {
  final dio = Dio(
    BaseOptions(
      followRedirects: false,
      baseUrl: Env.apiDomain,
      connectTimeout: const Duration(milliseconds: 5000),
      receiveTimeout: const Duration(milliseconds: 3000),
      headers: {"Accept": "application/json"},
    ),
  );
  dio.interceptors.clear();
  dio.interceptors.add(
    QueuedInterceptorsWrapper(
      onRequest: (options, handler) {
        return handler.next(options);
      },
      onResponse: (response, handler) {
        return handler.next(response);
      },
      onError: (error, handler) {
        return handler.next(error);
      },
    ),
  );
  return dio;
});
