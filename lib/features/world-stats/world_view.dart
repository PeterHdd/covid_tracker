import 'package:covid_tracker/base/base_view_model.dart';
import 'package:covid_tracker/components/chart_comp.dart';
import 'package:covid_tracker/components/container_comp.dart';
import 'package:covid_tracker/components/pie_chart_comp.dart';
import 'package:covid_tracker/features/world-stats/world_view_model.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

  const TextStyle style = TextStyle(fontWeight: FontWeight.bold);


class WorldView extends StatelessWidget {
  const WorldView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<WorldViewModel>(
      create: (_) => WorldViewModel(),
      child: Scaffold(
        appBar: AppBar(
          systemOverlayStyle: Constants.statusBarColor,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          title: const Align(
            alignment: Alignment.topLeft,
            child: Text(
              Constants.titleWorldStatistics,
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              softWrap: true,
            ),
          ),
        ),
        body: Center(
          child: Consumer<WorldViewModel>(
            builder: (_, notifier, __) {
              if (notifier.state == NotifierState.loading) {
                return const CircularProgressIndicator();
              } else {
                return SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("${Constants.covidTodayCases} ${NumberFormat.decimalPattern().format(notifier.covidAllResponse!.todayCases)}",style: style.copyWith(color:Constants.textCasesColor)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("${Constants.covidTodayDeath} ${NumberFormat.decimalPattern().format(notifier.covidAllResponse!.todayDeaths)}",style: style.copyWith(color:Constants.textDeceasedColor),),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text("${Constants.covidUpdated} ${timeago.format(DateTime.fromMillisecondsSinceEpoch(notifier.covidAllResponse!.updated))}",style: style.copyWith(fontSize: 10),)
                        ),
                      GridView.count(
                        shrinkWrap: true,
                        primary: false,
                        padding: const EdgeInsets.all(20),
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                        crossAxisCount: 2,
                        children: <Widget>[
                          ContainerComp(
                              placeholder: Constants.covidConfirmed,
                              color: Constants.casesColor,
                              textColor: Constants.textCasesColor,
                              value: notifier.covidAllResponse!.cases),
                          ContainerComp(
                              placeholder: Constants.covidActive,
                              color: Constants.activeColor,
                              textColor: Constants.textActiveColor,
                              value: notifier.covidAllResponse!.active),
                          ContainerComp(
                              placeholder: Constants.covidRecovered,
                              color: Constants.recoveredColor,
                              textColor: Constants.textRecoveredColor,
                              value: notifier.covidAllResponse!.recovered),
                          ContainerComp(
                              placeholder: Constants.covidDeceased,
                              color: Constants.deceasedColor,
                              textColor: Constants.textDeceasedColor,
                              value: notifier.covidAllResponse!.deaths),
                        ],
                      ),
                       LineChartCovid(cases : notifier.covidHistoryResponse!.cases,deaths : notifier.covidHistoryResponse!.deaths,),
                      PieChartCovid(covidCases : notifier.covidAllResponse!.cases,covidDeath: notifier.covidAllResponse!.deaths,covidRecovered: notifier.covidAllResponse!.recovered)
                    ],
                  ),
                );
              }
            },
          ),
          //   ),
        ),
      ),
    );
  }
}
