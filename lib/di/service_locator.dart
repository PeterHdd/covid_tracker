import 'package:covid_tracker/features/country-stats/country_view_detail_repository.impl.dart';
import 'package:covid_tracker/features/country-stats/country_view_detail_service.dart';
import 'package:covid_tracker/features/vaccination-stats/vaccination_view_repository_impl.dart';
import 'package:covid_tracker/features/vaccination-stats/vaccination_view_service.dart';
import 'package:covid_tracker/features/world-stats/world_view_repository_impl.dart';
import 'package:covid_tracker/features/world-stats/world_view_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

initLocator() {
  locator.registerLazySingleton<WorldViewRepository>(() => WorldViewRepositoryImpl());
  locator.registerLazySingleton<WorldViewService>(() => WorldViewService(Dio()));

  locator.registerLazySingleton<CountryViewDetailRepository>(() => CountryViewDetailRepositoryImpl());
  locator.registerLazySingleton<CountryViewDetailService>(() => CountryViewDetailService(Dio()));

  locator.registerLazySingleton<VaccinationViewRepository>(() => VaccinationViewRepositoryImpl());
  locator.registerLazySingleton<VaccinationViewService>(() => VaccinationViewService(Dio()));
  
  locator.registerSingleton(Dio());
}