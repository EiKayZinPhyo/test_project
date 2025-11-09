import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:test_project/app/data/model/auth_model/auth_info_model.dart';
import 'package:test_project/app/data/model/auth_model/sign_in_payload.dart';

part 'auth_api.g.dart';

@RestApi(baseUrl: "This will be ignored")
abstract class AuthApi {
  factory AuthApi(Dio dio, {String? baseUrl}) = _AuthApi;

@POST("/user/auth/sign_in")
Future<HttpResponse<AuthInfoModel>> signIn(
  @Body() SignInPayLoad signInPayLoad,
    );

}