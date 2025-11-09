import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_project/app/data/model/auth_model/auth_info_model.dart';
import 'package:test_project/app/data/model/auth_model/sign_in_payload.dart';
import 'package:test_project/app/provider/auth_provider/auth_core_provider.dart';

class AuthSignInNotifier extends AutoDisposeAsyncNotifier<AuthInfoModel?> {

  Future<void> signIn(SignInPayLoad signInPayLoad) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      AuthInfoModel authInfoModel = await ref
          .refresh(authRepoProvider)
          .signIn(signInPayLoad: signInPayLoad);
      if (authInfoModel.personFormInformation?.register == true) {
      }
      return authInfoModel;
    });
  }
  @override
  FutureOr<AuthInfoModel?> build() {
   return null;
  }
}

final authSignInNotifierProvider =
AutoDisposeAsyncNotifierProvider<AuthSignInNotifier, AuthInfoModel?>(AuthSignInNotifier.new);