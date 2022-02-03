// ignore_for_file: must_be_immutable
//TODO: fix immutability later on
import 'package:covid_tracker/utils/constants.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';


class _LineChart extends StatelessWidget {
   double _maxX = 0;
   double _maxY = 0;
  final List<FlSpot> _spots = [];
  final List<FlSpot> _deathsSpots = [];
  final Map<String, dynamic> cases;
  final Map<String, dynamic> deaths;
  _LineChart({required this.cases, required this.deaths});

  @override
  Widget build(BuildContext context) {
    return LineChart(addData());
  }

  FlGridData _buildGridData() {
    return FlGridData(
      show: false);
  }

  FlTitlesData _buildTitleData() {
    return FlTitlesData(
      show: true,
      topTitles: SideTitles(showTitles: false),
      bottomTitles: SideTitles(
        showTitles: true,
        reservedSize: 22,
        getTextStyles: (context, style) {
          return const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16);
        },
        getTitles: (value) {
          if (value == (cases.length / 2).ceil()) return 'Active cases';
          return '';
        },
        margin: 8,
      ),
      leftTitles: SideTitles(
        showTitles: true,
        getTextStyles: (context, style) {
          return const TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 10);
        },
        getTitles: (value) {
          if (value == _maxY || value % (_maxY / 5) == 0) {
            return "";
          }
          return '';
        },
        reservedSize: 28,
        margin: 12,
      ),
    );
  }

  FlBorderData _buildBorderData() {
    return FlBorderData(
      show: true,
      border: Border.all(color: const Color(0xff37434d), width: 1),
    );
  }

  void prepareData() {
    cases.forEach((key, value) {
      double val = (value as num).toDouble();
      _maxY = val > _maxY ? val : _maxY;
      _spots.add(FlSpot(_maxX++, (val)));
    });
    _maxX -= 0.5;
    _maxX = 0;
    deaths.forEach((key, value) {
      double val = (value as num).toDouble();
      _deathsSpots.add(FlSpot(_maxX++, (val)));
    });
  }

  LineChartData addData() {
    prepareData();
    return LineChartData(
      gridData: _buildGridData(),
      titlesData: _buildTitleData(),
      borderData: _buildBorderData(),
      minX: 0,
      minY: 0,
      maxX: _maxX,
      maxY: _maxY + _maxY * 0.2,
      lineBarsData: [
        LineChartBarData(
          colors: [Colors.green],
          spots: _spots,
          isCurved: true,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
        ),
        LineChartBarData(
          colors: [Colors.red],
          spots: _deathsSpots,
          isCurved: true,
          barWidth: 2,
          isStrokeCapRound: true,
          dotData: FlDotData(show: false),
        ),
      ],
    );
  }
}

class LineChartCovid extends StatefulWidget {
  final Map<String, dynamic> cases;
  final Map<String, dynamic> deaths;
  const LineChartCovid({Key? key, required this.cases, required this.deaths})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => LineChartCovidState();
}

class LineChartCovidState extends State<LineChartCovid> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
            child : Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  Constants.covidTimeLine,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 16.0, left: 6.0),
                    child:
                        _LineChart(cases: widget.cases, deaths: widget.deaths),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.circle,
                              color: Colors.green,
                              size: 20,
                            ),
                          ),
                          TextSpan(
                            text: Constants.covidCases,
                            style: TextStyle(color: Colors.green),
                          ),
                        ])),
                    const SizedBox(
                      width: 10,
                    ),
                    RichText(
                        text: const TextSpan(
                            style: TextStyle(
                              fontSize: 17,
                            ),
                            children: [
                          WidgetSpan(
                            child: Icon(
                              Icons.circle,
                              color: Colors.red,
                              size: 20,
                            ),
                          ),
                          TextSpan(
                            text: Constants.covidDeath,
                            style: TextStyle(color: Colors.red),
                          ),
                        ]))
                  ],
                )
              ],
            ),
    );
  }
}
