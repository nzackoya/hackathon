import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:init/screens/login/login_view.dart';
import 'package:path_provider/path_provider.dart';

final hiveHelperProvider = Provider<HiveHelper>((ref) {
  return HiveHelper(ref);
});

class HiveHelper extends StateNotifier<String?> {

  final Ref ref;

  HiveHelper(this.ref) : super(null) {
    _init();
  }

  _init() async {
    final applicatonDocumentDir = await getApplicationDocumentsDirectory();
    Hive.init(applicatonDocumentDir.path);
    await Hive.openBox('preferences');
    ref.read(loginProviderProvider.notifier).loadToken(getToken());
  }

  setToken(String? token) async {
    await Hive.box('preferences').put('token', token);
  }

  String? getToken() {
    return Hive.box('preferences').get('token', defaultValue: null);
  }
}