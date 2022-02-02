import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ContainerComp extends StatelessWidget {
  final Color color;
  final Color textColor;
  final String placeholder;
  final int value;
  const ContainerComp(
      {Key? key,
      required this.placeholder,
      required this.color,
      required this.textColor,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(Radius.circular(20))),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              placeholder,
              style: TextStyle(color: textColor, fontWeight: FontWeight.bold),
            ),
            Align(
              child: Text(NumberFormat.decimalPattern().format(value),
                  style:
                      TextStyle(fontWeight: FontWeight.bold, color: textColor)),
              alignment: Alignment.bottomRight,
            ),
          ],
        ));
  }
}
