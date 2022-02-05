import 'package:covid_tracker/base/base_view_model.dart';
import 'package:covid_tracker/components/chart_comp.dart';
import 'package:covid_tracker/components/container_comp.dart';
import 'package:covid_tracker/components/pie_chart_comp.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'country_view_detail_view_model.dart';

const TextStyle style = TextStyle(fontWeight: FontWeight.bold);

class CountryViewDetail extends StatefulWidget {
  const CountryViewDetail({Key? key}) : super(key: key);

  @override
  State<CountryViewDetail> createState() => _CountryViewDetailState();
}

class _CountryViewDetailState extends State<CountryViewDetail> {
   CountryViewDetailViewModel? countryDetailViewModel;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      countryDetailViewModel = Provider.of<CountryViewDetailViewModel>(context, listen: false);
      countryDetailViewModel!.getCovidCountryData();   
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: Constants.statusBarColor,
        backgroundColor: Colors.transparent,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0.0,
        title:  Align(
          alignment: Alignment.topLeft,
          child: Text(
            '${Provider.of<CountryViewDetailViewModel>(context, listen: false).selectedCountry} Statistics',
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            overflow: TextOverflow.visible,
            softWrap: true,
          ),
        ),
      ),
      body: Center(
        child: Consumer<CountryViewDetailViewModel>(
          builder: (_, notifier, __) {
            if (notifier.state == NotifierState.loading) {
              return const CircularProgressIndicator();
            }
            else if(notifier.errorMessage.isNotEmpty){
              return Text(notifier.errorMessage,style: const TextStyle(fontSize: 15),);
            } else {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                          "${Constants.covidTodayCases} ${NumberFormat.decimalPattern().format(notifier.covidAllResponse!.todayCases)}",
                          style:
                              style.copyWith(color: Constants.textCasesColor)),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Text(
                        "${Constants.covidTodayDeath} ${NumberFormat.decimalPattern().format(notifier.covidAllResponse!.todayDeaths)}",
                        style:
                            style.copyWith(color: Constants.textDeceasedColor),
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Text(
                          "${Constants.covidUpdated} ${timeago.format(DateTime.fromMillisecondsSinceEpoch(notifier.covidAllResponse!.updated))}",
                          style: style.copyWith(fontSize: 10),
                        )),
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
                     LineChartCovid(cases : notifier.covidHistoryResponse!.timeline.cases,deaths : notifier.covidHistoryResponse!.timeline.deaths,),
                     PieChartCovid(covidCases : notifier.covidAllResponse!.cases,covidDeath: notifier.covidAllResponse!.deaths,covidRecovered: notifier.covidAllResponse!.recovered)
                  ],
                ),
              );
            }
          },
        ),
        //   ),
      ),
    );
  }
}
