import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StatsContainerComp extends StatelessWidget {
  final Color boxColor;
  final Color textColor;
  final String placeholder;
  final double value;
  const StatsContainerComp(
      {Key? key,
      required this.placeholder,
      required this.boxColor,
      required this.textColor,
      required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: boxColor,
            borderRadius: const BorderRadius.all(Radius.circular(10))),
        padding: const EdgeInsets.all(8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              NumberFormat.decimalPattern()
                  .format(value),
              style:  TextStyle(
                  color: textColor, fontWeight: FontWeight.bold),
            ),
             Text(
              placeholder,
              style: TextStyle(color: textColor),
            ),
          ],
        ));
  }
}
