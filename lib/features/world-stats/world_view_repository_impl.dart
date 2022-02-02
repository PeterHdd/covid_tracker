import 'package:covid_tracker/di/service_locator.dart';
import 'package:covid_tracker/features/world-stats/world_view_service.dart';
import 'package:covid_tracker/models/covid_all_response.dart';
import 'package:covid_tracker/models/covid_history_response.dart';

class WorldViewRepositoryImpl implements WorldViewRepository {

  WorldViewService service = locator<WorldViewService>();

  @override
  Future<CovidAllResponse> getCovidAllData() {
    return service.getCovidAllData();
  }

  @override
  Future<CovidHistoryResponse> getCovidHistoryData() {
    return service.getCovidHistoryData();
  }
  
}

abstract class WorldViewRepository {
  Future<CovidAllResponse> getCovidAllData();
  Future<CovidHistoryResponse> getCovidHistoryData();
}