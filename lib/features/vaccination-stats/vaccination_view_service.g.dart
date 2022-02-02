// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vaccination_view_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _VaccinationViewService implements VaccinationViewService {
  _VaccinationViewService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://disease.sh/v3/covid-19/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<VaccinationResponse> getCountryVaccinationData(
      {required country}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<VaccinationResponse>(Options(
                method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options,
                'vaccine/coverage/countries/$country?lastdays=1&fullData=true',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = VaccinationResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
