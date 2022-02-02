import 'package:covid_tracker/base/base_view_model.dart';
import 'package:covid_tracker/models/countries.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/services.dart' show rootBundle;

class CountryViewModel extends BaseViewModel {
  String resultJson = "";
  List<Countries> _countryList = [];

  CountryViewModel() {
    _getCountries();
  }

  void _getCountries() async {
    setState(NotifierState.loading);
    resultJson = await rootBundle.loadString(Constants.countriesURL);
    setState(NotifierState.loaded);
  }

  List<Countries> get getCountryList => _countryList;
  set setCountryList(List<Countries> countryList) => _countryList = countryList;

  modifySearchedList(List<Countries> dummyListData) {
    _countryList.clear();
    _countryList.addAll(dummyListData);
    notifyListeners();
  }
}
