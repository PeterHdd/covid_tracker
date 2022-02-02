
import 'package:covid_tracker/models/covid_country_response.dart';
import 'package:covid_tracker/models/covid_history_country_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:covid_tracker/utils/constants.dart';

part 'country_view_detail_service.g.dart';

@RestApi(baseUrl: Constants.covidURL)
abstract class CountryViewDetailService {

  factory CountryViewDetailService(Dio dio, {String baseUrl}) =  _CountryViewDetailService;

  @GET("countries/{country}")
  Future<CovidCountryResponse> getCovidAllData({@Path("country") required String country});

  @GET("historical/{country}?lastdays=all")
  Future<CovidHistoryCountryResponse> getCovidHistoryData({@Path("country") required String country});
}