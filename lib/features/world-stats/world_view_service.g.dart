// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'world_view_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _WorldViewService implements WorldViewService {
  _WorldViewService(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://disease.sh/v3/covid-19/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<CovidAllResponse> getCovidAllData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CovidAllResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CovidAllResponse.fromJson(_result.data!);
    return value;
  }

  @override
  Future<CovidHistoryResponse> getCovidHistoryData() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<CovidHistoryResponse>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, 'historical/all?lastdays=all',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = CovidHistoryResponse.fromJson(_result.data!);
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
