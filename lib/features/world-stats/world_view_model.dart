
import 'package:covid_tracker/base/base_view_model.dart';
import 'package:covid_tracker/di/service_locator.dart';
import 'package:covid_tracker/features/world-stats/world_view_repository_impl.dart';
import 'package:covid_tracker/models/covid_all_response.dart';
import 'package:covid_tracker/models/covid_history_response.dart';

class WorldViewModel extends BaseViewModel {
  final WorldViewRepository _repository = locator<WorldViewRepository>();
  CovidAllResponse? covidAllResponse;
  CovidHistoryResponse? covidHistoryResponse;

  WorldViewModel() {
    _getCovidAllData();
  }

  void _getCovidAllData() async {
    setState(NotifierState.loading);
    covidAllResponse = await _repository.getCovidAllData();
    await _getCovidHistoryData();
    setState(NotifierState.loaded);
  }

  Future<void> _getCovidHistoryData() async {
    covidHistoryResponse = await _repository.getCovidHistoryData();
  }
}
