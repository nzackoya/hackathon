import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:init/style/init_style.dart';

extension ProviderExtension<T> on AsyncValue<T> {
  Widget handle({
    required Widget Function(T data) data,
    Widget Function(Object error, StackTrace stackTrace)? error,
    Widget Function()? loading
  }) {
    return when(
        data: data,
        error: error ?? (e, trace) => Scaffold(body:
            ColoredBox(
                color: Colors.white,
                child: Center(
                    child: Text(e.toString(),
            style: InitStyle.textSemiBold20Neutral1000)))),
        loading: loading ?? () => const Scaffold(body:
              ColoredBox(
              color: Colors.white,
              child: Center(child: CircularProgressIndicator())
    )
    )
    );
  }
}