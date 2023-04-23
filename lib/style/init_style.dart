import 'package:flutter/material.dart';

class InitStyle {
  InitStyle._();

  static const TextStyle textMedium16Neutral1000 = TextStyle(fontSize: 16, color: Colors.black87, fontWeight: FontWeight.w500);
  static const TextStyle textMedium16Neutral500 = TextStyle(fontSize: 16, color: Colors.black54, fontWeight: FontWeight.w500);
  static const TextStyle textMedium12Neutral500 = TextStyle(fontSize: 12, color: Colors.black54, fontWeight: FontWeight.w500);
  static const TextStyle textSemiBold20Neutral1000 = TextStyle(fontSize: 20, color: Colors.black87, fontWeight: FontWeight.w700);


  static getButton(String text, void Function() onTap, {bool isActive = true}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 150,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(4)),
            color: isActive ? Colors.red : Colors.black12
        ),
        child: Text(text, textAlign: TextAlign.center,
          style: InitStyle.textMedium16Neutral1000.copyWith(color: Colors.white),),
      ),
    );
  }
}