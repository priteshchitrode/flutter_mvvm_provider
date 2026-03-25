import 'package:dio/dio.dart';
import 'package:flutter_mvvm_provider/data/network/api_service.dart';
import 'package:flutter_mvvm_provider/data/storage/secured_shared_preferences.dart';
import 'package:flutter_mvvm_provider/features/authentication/repository/auth_repository.dart';
import 'package:flutter_mvvm_provider/features/authentication/repository/login_repository.dart';
import 'package:flutter_mvvm_provider/features/authentication/repository/user_information_repository.dart';
import 'package:flutter_mvvm_provider/features/authentication/service/login_service.dart';
import 'package:flutter_mvvm_provider/features/authentication/view_model/login_view_model.dart';
import 'package:flutter_mvvm_provider/features/splash/splash_repository.dart';
import 'package:flutter_mvvm_provider/features/splash/splash_service.dart';
import 'package:flutter_mvvm_provider/features/splash/splash_view_mode.dart';
import 'package:flutter_mvvm_provider/service/push_notification/notification_service.dart';
import 'package:flutter_mvvm_provider/utils/custom_log.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

var locator = GetIt.instance;

void initLocator() {
  try {
    CustomLog.info(locator, "Registering services with GetIt...");

    // Shared Manager
    locator.registerLazySingleton(() => const FlutterSecureStorage());
    locator.registerLazySingleton(() => SecuredSharedPreferences(locator<FlutterSecureStorage>()));

    // Firebase
    //locator.registerLazySingleton(() => AnalyticsHelper());

    // Auth Services
    locator.registerLazySingleton<Dio>(() => Dio());
    locator.registerLazySingleton(() => ApiService(locator<Dio>(), locator<SecuredSharedPreferences>()));

    // Service
    locator.registerLazySingleton(() => SplashService(locator<UserInformationRepository>()));
    locator.registerLazySingleton(() => NotificationService(locator<SecuredSharedPreferences>()));
    locator.registerLazySingleton(() => LoginService(locator<ApiService>()));

    // Repository
    locator.registerLazySingleton(() => UserInformationRepository(locator<SecuredSharedPreferences>()));
    locator.registerLazySingleton(() => SplashRepository(locator<SplashService>()));
    locator.registerLazySingleton(() => AuthRepository(locator<SecuredSharedPreferences>(), locator<NotificationService>()));
    locator.registerLazySingleton(() => LoginRepository(locator<LoginService>()));

    // View Model
    locator.registerLazySingleton(() => SplashViewModel(locator<SplashRepository>(), locator<AuthRepository>()));
    locator.registerLazySingleton(() => LoginViewModel(locator<LoginRepository>()));


    CustomLog.info(locator, "All instances registered.");
  } catch (e) {
    CustomLog.error(locator, "ERROR : All instances are not registered.", e);
  }

}