
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/model/error_response.dart';
import 'package:init/model/services_response.dart';
import 'package:init/network/cient_view.dart';
import 'package:init/util/init_messenger.dart';

final servicesProvider = FutureProvider<Map<int, String>>((ref) async {
  final servicesResponse = await ref.read(clientProvider).services();
  try {
    return ServicesResponse.fromJson(servicesResponse).services;
  } catch (e, stack) {
    InitMessenger.showErrorBar(ErrorResponse.fromJson(servicesResponse).error);
    rethrow;
  }
});
