import 'package:flutter_mvvm_provider/dependency_injection/locator.dart';
import 'package:flutter_mvvm_provider/features/authentication/view_model/login_view_model.dart';
import 'package:flutter_mvvm_provider/features/splash/splash_view_mode.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';


class AppProviders {

  static List<SingleChildWidget> getProviders() {
    return [
      ChangeNotifierProvider(create: (_) => locator<SplashViewModel>()),
      ChangeNotifierProvider(create: (_) => locator<LoginViewModel>()),
    ];
  }


}