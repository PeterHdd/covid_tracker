import 'package:covid_tracker/base/base_view_model.dart';
import 'package:covid_tracker/di/service_locator.dart';
import 'package:covid_tracker/features/vaccination-stats/vaccination_view_repository_impl.dart';
import 'package:covid_tracker/models/vaccination_response.dart';
import 'package:covid_tracker/utils/constants.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class VaccinationViewModel extends BaseViewModel {
  final VaccinationViewRepository _repository = locator<VaccinationViewRepository>();
  VaccinationResponse? vaccinationResponse;

  Set<Marker> _markers = {};
  String _countryName = "";
  bool _status = false;

  bool get status => _status;
  String get countryName => _countryName;
  Set<Marker> get markers => _markers;
  set markers(Set<Marker> value) => _markers = {};

  onTap(LatLng latLng) async {
    _countryName = (await _fetchCountryName(latLng))!;
    _markers.add(Marker(markerId: const MarkerId('marker'), position: latLng));
    notifyListeners();
    if(_countryName.isNotEmpty){
      switch(_countryName){
        case Constants.unitedKingdom:
          _countryName = Constants.unitedKingdomCode;
          break;
        case Constants.unitedStates:
        _countryName = Constants.unitedStatesCode;
        break;
        case Constants.southKorea:
        _countryName = Constants.southKoreaCode;
        break;
      }
    await fetchVaccinationData(countryName: _countryName);
    }
    notifyListeners();
  }

  Future<String?> _fetchCountryName(LatLng latLng) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latLng.latitude, latLng.longitude);
      _status = false;
      return placemarks[0].country;
    } on PlatformException {
      _status = true;
      return "";
    }
  }

  fetchVaccinationData({required String countryName}) async {
    vaccinationResponse = await _repository.getCountryVaccinationData(country: countryName);
  }
}
