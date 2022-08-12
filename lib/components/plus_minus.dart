import 'package:flutter/material.dart';

import '../utilities.dart';

Widget plusMinus({
  required final Function(int) onChanged,
  final int range = 1,
  final int defaultValue = 0,
  final Widget? addWidget,
  final Widget? minusWidget,
  final double spaceBetween = 10,
  final TextStyle? textStyle,
  final MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  final MainAxisSize mainAxisSize = MainAxisSize.min,
}) {
  int currentAmount = defaultValue;

  final RegExp reg = RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  String mathFunc(final Match match) => '${match[1]},';

  void increaseAmount() {
    currentAmount = currentAmount + range;
    onChanged(currentAmount);
  }

  void decreaseAmount() {
    if (currentAmount > range - 1) currentAmount = currentAmount - range;
    onChanged(currentAmount);
  }

  String amountString() {
    final String result = currentAmount
        .toString()
        .padLeft(
          currentAmount.toString().length,
          '0',
        )
        .replaceAllMapped(reg, mathFunc);
    return result;
  }

  return StatefulBuilder(
    builder: (final _, final StateSetter setter) => Row(
      mainAxisAlignment: mainAxisAlignment,
      mainAxisSize: mainAxisSize,
      children: <Widget>[
        GestureDetector(
            onTap: () {
              setter(() => increaseAmount());
            },
            child: addWidget ??
                Icon(
                  Icons.add_circle,
                  size: 30,
                )),
        Text(amountString(), style: textStyle).marginSymmetric(horizontal: spaceBetween),
        GestureDetector(
            onTap: () {
              setter(() => decreaseAmount());
            },
            child: minusWidget ??
                Icon(
                  Icons.remove_circle,
                  size: 30,
                )),
      ],
    ),
  );
}
