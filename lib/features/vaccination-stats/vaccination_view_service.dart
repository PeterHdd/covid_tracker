
import 'package:covid_tracker/models/vaccination_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:covid_tracker/utils/constants.dart';

part 'vaccination_view_service.g.dart';

@RestApi(baseUrl: Constants.covidURL)
abstract class VaccinationViewService {

  factory VaccinationViewService(Dio dio, {String baseUrl}) =  _VaccinationViewService;

  @GET("vaccine/coverage/countries/{country}?lastdays=1&fullData=true")
  Future<VaccinationResponse> getCountryVaccinationData({@Path("country") required String country});
}