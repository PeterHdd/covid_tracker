import 'package:covid_tracker/base/base_view_model.dart';
import 'package:covid_tracker/features/country-stats/country_view_detail.dart';
import 'package:covid_tracker/features/country-stats/country_view_detail_view_model.dart';
import 'package:covid_tracker/features/country-stats/country_view_model.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:convert';
import 'package:provider/provider.dart';


class CountryView extends StatefulWidget {
  const CountryView({Key? key}) : super(key: key);

  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  TextEditingController editingController = TextEditingController();
  List<Countries> countriesResult = [];
  List<Countries> tempList = [];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CountryViewModel>(
        create: (_) => CountryViewModel(),
        child: Scaffold(
            appBar: AppBar(
              systemOverlayStyle: Constants.statusBarColor,
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              title: const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  Constants.countryStatistics,
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                  softWrap: true,
                ),
              ),
            ),
            body: Consumer2<CountryViewModel,CountryViewDetailViewModel>(
              builder: (_, notifier, detailNotifier,__) {
                if (notifier.state == NotifierState.loading) {
                  return const Center(child: CircularProgressIndicator());
                } else {
                  if (notifier.getCountryList.isEmpty) {
                    countriesResult =
                        (json.decode(notifier.resultJson) as List<dynamic>)
                            .map((i) => Countries.fromJson(i))
                            .toList();
                    notifier.setCountryList = countriesResult;
                    tempList = countriesResult;
                  }
                  return Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          onChanged: (value) {
                            filterSearchResults(value, context, notifier);
                          },
                          controller: editingController,
                          decoration: const InputDecoration(
                              labelText: Constants.covidSearch,
                              hintText: Constants.covidSearch,
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(25.0)))),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return ListTile(
                                  onTap: () {
                                    detailNotifier.countrySelected =
                                        countriesResult[index].name;
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const CountryViewDetail()),
                                    );
                                  },
                                  leading: SvgPicture.network(
                                      countriesResult[index].image),
                                  title: Text(countriesResult[index].name));
                            },
                            itemCount: countriesResult.length),
                      ),
                    ],
                  );
                }
              },
            )));
  }

  void filterSearchResults(
      String query, BuildContext context, CountryViewModel viewModel) {
    if (query.isNotEmpty) {
      List<Countries> dummyListData = [];
      for (var item in tempList) {
        if (item.name.contains(query[0].toUpperCase() + query.substring(1))) {
          dummyListData.add(item);
        }
      }
      viewModel.modifySearchedList(dummyListData);
    } else {
      viewModel.modifySearchedList(tempList);
    }
  }
}
