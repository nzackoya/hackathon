
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/model/error_response.dart';
import 'package:init/model/token_response.dart';
import 'package:init/network/cient_view.dart';
import 'package:init/screens/profile/profile_view.dart';
import 'package:init/util/hive_helper.dart';
import 'package:init/util/init_messenger.dart';

final loginProviderProvider =
StateNotifierProvider<Login, AsyncValue<String?>>((ref) {
  return Login(ref);
});

class Login extends StateNotifier<AsyncValue<String?>>  {

  final Ref _ref;

  Login(this._ref) : super(const AsyncValue.data(null));

  login(String username, String password) async {
    final tokenResult = await _ref.read(clientProvider).login(username, password);
    try {
      final tokenResponse = TokenResponse.fromJson(tokenResult);
      await _ref.read(hiveHelperProvider).setToken(tokenResponse.token);
      _ref.watch(loginProviderProvider.notifier).loadToken(tokenResponse.token);
    } catch (e, stack) {
      _ref.read(hiveHelperProvider).setToken(null);
      InitMessenger.showErrorBar(ErrorResponse.fromJson(tokenResult).error);
    }
  }

  auth(String username, String password, String type) async {
    final tokenResult = await _ref.read(clientProvider).auth({"email": username, "password": password, "type": type });
    try {
      final tokenResponse = TokenResponse.fromJson(tokenResult);
      await  _ref.read(hiveHelperProvider).setToken(tokenResponse.token);
      _ref.watch(loginProviderProvider.notifier).loadToken(tokenResponse.token);
    } catch (e, stack) {
      _ref.read(hiveHelperProvider).setToken(null);
      InitMessenger.showErrorBar(ErrorResponse.fromJson(tokenResult).error);
    }
  }

  loadToken(String? token) {
    state = AsyncValue.data(token);

    if (token != null) {
      _ref.read(profileProviderProvider.notifier).loadUser();
    }
  }

  logOut() {
    _ref.read(hiveHelperProvider).setToken(null);
    state = const AsyncValue.data(null);
  }
}
