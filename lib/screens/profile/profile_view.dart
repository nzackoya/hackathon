
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/model/error_response.dart';
import 'package:init/model/success_response.dart';
import 'package:init/model/user.dart';
import 'package:init/model/user_update_request.dart';
import 'package:init/network/cient_view.dart';
import 'package:init/screens/login/login_view.dart';
import 'package:init/util/init_messenger.dart';

final profileProviderProvider =
StateNotifierProvider<Profile, AsyncValue<User?>>((ref) {
  return Profile(ref);
});

class Profile extends StateNotifier<AsyncValue<User?>>  {

  final Ref _ref;

  Profile(this._ref) : super(const AsyncValue.data(null));

  loadUser() async {
    final userResponse = await _ref.read(clientProvider).getUser();
    try {
      final userResult = User.fromJson(userResponse);
      state = AsyncValue.data(userResult);
    } catch (e, stack) {
      final error = ErrorResponse.fromJson(userResponse).error;
      if (error == 'invalid token') {
        _ref.read(loginProviderProvider.notifier).logOut();
      }
      InitMessenger.showErrorBar(error);
    }
  }

  updateUser(User user) async {
    final userResponse = await _ref.read(clientProvider).setUser(
        UserUpdateRequest(user.id, user.name, user.services?.keys.toList() ?? [], user.description)
    );
    try {
      final userResult = SuccessResponse.fromJson(userResponse);
      state = AsyncValue.data(user);
      InitMessenger.showConfirmationBar('Успешно обновлено');
    } catch (e, stack) {
      final error = ErrorResponse.fromJson(userResponse).error;
      if (error == 'invalid token') {
        _ref.read(loginProviderProvider.notifier).logOut();
      }
      InitMessenger.showErrorBar(error);
    }
  }
}
