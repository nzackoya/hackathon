import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/network/RestClient.dart';
import 'package:dio/dio.dart';
import 'package:init/screens/login/login_view.dart';
import 'package:init/util/hive_helper.dart';

final clientProvider = Provider.autoDispose<RestClient>((ref) {
  final token = ref.watch(hiveHelperProvider).getToken();
  final dio = Dio();
  dio.options.headers["Content-Type"] = "application/json";
  if (token != null) {
    dio.options.headers["token"] = token;
  }
  return RestClient(dio);
});

