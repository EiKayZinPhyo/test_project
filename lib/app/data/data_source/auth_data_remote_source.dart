import 'package:test_project/app/data/api/auth_api.dart';
import 'package:test_project/app/data/model/auth_model/auth_info_model.dart';
import 'package:test_project/app/data/model/auth_model/sign_in_payload.dart';

abstract class AuthDataRemoteSource{

  Future<AuthInfoModel> signIn(SignInPayLoad signInPayLoad);
}

class AuthDataRemoteSourceImpl extends AuthDataRemoteSource{
  final AuthApi authApi;
  AuthDataRemoteSourceImpl(this.authApi);

  @override
  Future<AuthInfoModel> signIn(SignInPayLoad signInPayLoad) async{
    try {
      final responseData = await authApi.signIn(signInPayLoad);
      if (responseData.response.statusCode == 200) {
        return responseData.data;
      } else {
        throw Exception();
      }
    } catch (e) {
      rethrow;
    }
  }
  
}