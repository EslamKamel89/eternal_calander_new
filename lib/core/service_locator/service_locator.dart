import 'package:dio/dio.dart';
import 'package:eternal_calander_new/core/api_service/api_consumer.dart';
import 'package:eternal_calander_new/core/api_service/dio_consumer.dart';
import 'package:eternal_calander_new/core/router/app_router.dart';
import 'package:eternal_calander_new/core/router/middleware.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt serviceLocator = GetIt.instance;

Future initServiceLocator() async {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: serviceLocator()));
  final prefs = await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferences>(() => prefs);
  serviceLocator.registerLazySingleton<AppMiddleWare>(() => AppMiddleWare(sharedPreferences: serviceLocator()));
  serviceLocator.registerLazySingleton<AppRouter>(() => AppRouter(appMiddleWare: serviceLocator()));

  // serviceLocator.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSource(api: serviceLocator()));
  // serviceLocator.registerLazySingleton<HomeRepo>(() => HomeRepoImp(homeRemoteDataSource: serviceLocator()));
}
