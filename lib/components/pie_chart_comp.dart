import 'package:covid_tracker/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;
  final Color textColor;

  const Indicator({
    Key? key,
    required this.color,
    required this.text,
    required this.isSquare,
    this.size = 16,
    this.textColor = const Color(0xff505050),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 4,
        ),
        Text(
          text,
          style: TextStyle(
              fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
        )
      ],
    );
  }
}

class PieChartCovid extends StatefulWidget {
  final int covidCases;
  final int covidDeath;
  final int covidRecovered;
  const PieChartCovid({Key? key, required this.covidCases,required this.covidDeath,required this.covidRecovered}) : super(key: key);

  @override
  State<StatefulWidget> createState() => PieChartCovidState();
}

class PieChartCovidState extends State<PieChartCovid> {
  double _active = 100, _recovered = 0, _death = 0;

  @override
  void initState() {
    super.initState();
        setState(() {
      int total = widget.covidCases;
      int death = widget.covidDeath;
      int recovered = widget.covidRecovered;

      _active = 100 * ((total - death - recovered) / total);
      _death = 100 * (death / total);
      _recovered = 100 * (recovered / total);
      double sum = _active + _death + _recovered;
      if (sum < 100) _active = 100 - sum;
    });
  }

  int touchedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.3,
        child: Row(
          children: <Widget>[
            const SizedBox(
              height: 18,
            ),
            Expanded(
              child: AspectRatio(
                aspectRatio: 1,
                child: PieChart(
                  PieChartData(
                      pieTouchData: PieTouchData(touchCallback:
                          (FlTouchEvent event, pieTouchResponse) {
                        setState(() {
                          if (!event.isInterestedForInteractions ||
                              pieTouchResponse == null ||
                              pieTouchResponse.touchedSection == null) {
                            touchedIndex = -1;
                            return;
                          }
                          touchedIndex = pieTouchResponse
                              .touchedSection!.touchedSectionIndex;
                        });
                      }),
                      borderData: FlBorderData(
                        show: false,
                      ),
                      sectionsSpace: 0,
                      centerSpaceRadius: 40,
                      sections: showingSections()),
                ),
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  <Widget>[
                const Indicator(
                  color: Constants.textRecoveredColor,
                  text: Constants.covidRecovered,
                  isSquare: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                Indicator(
                  color: Constants.textDeceasedColor,
                  text: Constants.covidDeath[0].toUpperCase() + Constants.covidDeath.substring(1),
                  isSquare: true,
                ),
                const SizedBox(
                  height: 4,
                ),
                const Indicator(
                  color: Constants.textActiveColor,
                  text: Constants.covidActive,
                  isSquare: true,
                ),
               const SizedBox(
                  height: 18,
                ),
              ],
            ),
            const SizedBox(
              width: 28,
            ),
          ],
        ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(3, (i) {
      final isTouched = i == touchedIndex;
      final fontSize = isTouched ? 25.0 : 16.0;
      final radius = isTouched ? 60.0 : 50.0;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: Constants.textActiveColor,
            value: _active,
            title: '${_active.toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Constants.textDeceasedColor,
            value: _death,
            title: '${_death.toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Constants.textRecoveredColor,
            value: _recovered,
            title: '${_recovered.toInt()}%',
            radius: radius,
            titleStyle: TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: const Color(0xffffffff)),
          );
        default:
          throw Error();
      }
    });
  }
}
