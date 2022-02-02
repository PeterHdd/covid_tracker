// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_view_detail_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _CountryViewDetailService implements CountryViewDetailService {
  _CountryViewDetailService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://disease.sh/v3/covid-19/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CovidCountryResponse> getCovidAllData({required country}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CovidCountryResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'countries/$country',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CovidCountryResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CovidHistoryCountryResponse> getCovidHistoryData(
      {required country}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CovidHistoryCountryResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'historical/$country?lastdays=all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CovidHistoryCountryResponse.fromJson(_result.data!);
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
