import 'package:covid_tracker/di/service_locator.dart';
import 'package:covid_tracker/features/vaccination-stats/vaccination_view_service.dart';
import 'package:covid_tracker/models/vaccination_response.dart';

class VaccinationViewRepositoryImpl implements VaccinationViewRepository {

  VaccinationViewService service = locator<VaccinationViewService>();

  @override
  Future<VaccinationResponse> getCountryVaccinationData({required String country}) {
    return service.getCountryVaccinationData(country: country);
  }
  
}

abstract class VaccinationViewRepository {
  Future<VaccinationResponse> getCountryVaccinationData({required String country});
}