import 'package:covid_tracker/di/service_locator.dart';
import 'package:covid_tracker/features/country-stats/country_view_detail_service.dart';
import 'package:covid_tracker/models/covid_country_response.dart';
import 'package:covid_tracker/models/covid_history_country_response.dart';

class CountryViewDetailRepositoryImpl implements CountryViewDetailRepository {

  CountryViewDetailService service = locator<CountryViewDetailService>();

  @override
  Future<CovidCountryResponse> getCovidAllData({required String countryName}) {
    return service.getCovidAllData(country: countryName);
  }

  @override
  Future<CovidHistoryCountryResponse> getCovidHistoryData({required String countryName}) {
    return service.getCovidHistoryData(country: countryName);
  }
  
}

abstract class CountryViewDetailRepository {
  Future<CovidCountryResponse> getCovidAllData({required String countryName});
  Future<CovidHistoryCountryResponse> getCovidHistoryData({required String countryName});
}