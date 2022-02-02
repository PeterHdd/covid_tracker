import 'package:covid_tracker/base/base_view_model.dart';
import 'package:covid_tracker/di/service_locator.dart';
import 'package:covid_tracker/features/country-stats/country_view_detail_repository.impl.dart';
import 'package:covid_tracker/models/covid_country_response.dart';
import 'package:covid_tracker/models/covid_history_country_response.dart';
import 'package:dio/dio.dart';

class CountryViewDetailViewModel extends BaseViewModel {
  final CountryViewDetailRepository _repository = locator<CountryViewDetailRepository>();
  CovidCountryResponse? covidAllResponse;
  CovidHistoryCountryResponse? covidHistoryResponse;
  String _countrySelected = ""; 
  String errorMessage = "";

  Future<void> _getCovidHistoryData() async {
    covidHistoryResponse = await _repository.getCovidHistoryData(countryName: selectedCountry);
  }

  Future<void> getCovidCountryData() async {
    try {
    setState(NotifierState.loading);
    covidAllResponse = await _repository.getCovidAllData(countryName: selectedCountry);
    await _getCovidHistoryData();
    setState(NotifierState.loaded);
    errorMessage = "";
    } catch(err){
      if(err is DioError){
        errorMessage = err.response!.data["message"];
      }
      setState(NotifierState.loaded);
    }
  }

    String get selectedCountry => _countrySelected;
  set countrySelected(String countrySelected) =>
      _countrySelected = countrySelected;
}
