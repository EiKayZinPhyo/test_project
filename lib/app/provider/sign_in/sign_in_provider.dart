import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignInEmailTextNotifier extends Notifier<String?>{
  @override
  build() {
    return null;
  }
  changeValue(String? value) {
    if (state != value) {
      state = value;
    }
  }
}
final signInEmailTextNotifierProvider = NotifierProvider<SignInEmailTextNotifier, String?>(SignInEmailTextNotifier.new);

///For Password
class SignInPasswordTextNotifier extends Notifier<String?>{
  @override
  String? build() {
    // TODO: implement build
    return null;
  }
  changeValue(String? value) {
    if (state != value) {
      state = value;
    }
  }

}

final signInPasswordTextNotifierProvider = NotifierProvider<SignInPasswordTextNotifier,String?>(SignInPasswordTextNotifier.new);

/// For Password Show
class SignInPassWordShowNotifier extends Notifier<bool> {
  @override
  bool build() {
    // TODO: implement build
    return false;
  }

  changeValue() {
    state = !state;
  }

}

final signInPasswordShowNotifierProvider = NotifierProvider<SignInPassWordShowNotifier, bool>(SignInPassWordShowNotifier.new);