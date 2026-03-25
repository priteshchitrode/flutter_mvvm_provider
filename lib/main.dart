import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/app_providers.dart';
import 'package:flutter_mvvm_provider/core/app_initializer.dart';
import 'package:flutter_mvvm_provider/routing/app_routes.dart';
import 'package:flutter_mvvm_provider/service/has_internet_connection.dart';
import 'package:flutter_mvvm_provider/utils/app_theme_style.dart';
import 'package:flutter_mvvm_provider/utils/extensions/state_extension.dart';
import 'package:provider/provider.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  void initState() {
    initFun();
    super.initState();
  }

  initFun()=> frameCallback(() async {
    await HasInternetConnection().checkConnectivity();
    // await authRepo.signOut();
  });


  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: AppProviders.getProviders(),
      child: MaterialApp.router(
        title: "Flutter MVVM Provider",
        debugShowCheckedModeBanner: false,
        theme: AppThemeStyle.appTheme,
        routerConfig: AppRoutes.router,
      ),
    );
  }
}
