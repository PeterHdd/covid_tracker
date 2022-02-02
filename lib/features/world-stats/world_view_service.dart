
import 'package:covid_tracker/models/covid_history_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:covid_tracker/models/covid_all_response.dart';
import 'package:covid_tracker/utils/constants.dart';

part 'world_view_service.g.dart';

@RestApi(baseUrl: Constants.covidURL)
abstract class WorldViewService {

  factory WorldViewService(Dio dio, {String baseUrl}) =  _WorldViewService;

  @GET("all")
  Future<CovidAllResponse> getCovidAllData();

  @GET("historical/all?lastdays=all")
  Future<CovidHistoryResponse> getCovidHistoryData();
}