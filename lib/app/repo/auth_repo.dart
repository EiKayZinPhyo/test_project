import 'package:test_project/app/data/data_source/auth_data_remote_source.dart';
import 'package:test_project/app/data/model/auth_model/auth_info_model.dart';
import 'package:test_project/app/data/model/auth_model/sign_in_payload.dart';

abstract class AuthRepo{
  Future<AuthInfoModel> signIn({
    required SignInPayLoad signInPayLoad,
    bool forceRefresh = false,
});
}

class AuthRepoImpl extends AuthRepo{
  AuthDataRemoteSource authDataRemoteSource;
  AuthRepoImpl({required this.authDataRemoteSource});

  @override
  Future<AuthInfoModel> signIn({required SignInPayLoad signInPayLoad, bool forceRefresh = false}) {
   return authDataRemoteSource.signIn(signInPayLoad);
  }
}