import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/app/data/api/auth_api.dart';
import 'package:test_project/app/data/data_source/auth_data_remote_source.dart';
import 'package:test_project/app/provider/core/no_auth_provider.dart';
import 'package:test_project/app/repo/auth_repo.dart';
import 'package:test_project/env/env.dart';

final _authProvider = Provider((ref) {
  final dio = ref.read(noAuthDioProvider);
  return AuthApi(dio, baseUrl: Env.apiDomain);
});

final _authRemoteSourceProvider = Provider((ref) {
  final authApi =ref.read(_authProvider);
  return AuthDataRemoteSourceImpl(authApi);
});

final authRepoProvider = Provider((ref) {
  final authRepo = ref.read(_authRemoteSourceProvider);
  return AuthRepoImpl(authDataRemoteSource: authRepo);
});