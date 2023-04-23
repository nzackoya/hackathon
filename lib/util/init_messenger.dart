import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:init/style/init_style.dart';


class InitMessenger  {

  InitMessenger._();

  static showBar(String message, Color color){
    showToastWidget(
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius:
              const BorderRadius.all(
                  Radius.circular(4)),
              border: Border.all(
                color: color,
                width: 1,
              ),
              boxShadow:  const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 24,
                  spreadRadius: 0,
                  offset: Offset(0, 8),
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(padding: const EdgeInsets.only(top: 16, bottom: 16, left: 20), child: Text(message,
                    style: InitStyle.textMedium16Neutral1000.copyWith(color: color))),
              ),
              IconButton(
                  onPressed: () => ToastManager().dismissAll(),
                  icon: const Icon(Icons.close))
            ],
          ),
        ),
        animation: StyledToastAnimation.none,
        reverseAnimation: StyledToastAnimation.none,
        isIgnoring: false,
        isHideKeyboard: true,
        duration: const Duration(seconds: 10));
  }

  static void showErrorBar(String message) {
    showBar(message, Colors.red);
  }

  static void showConfirmationBar(String message) {
    showBar(message, Colors.lightGreenAccent);
  }

}