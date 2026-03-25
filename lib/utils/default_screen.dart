import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/data/model/result.dart';
import 'package:flutter_mvvm_provider/routing/app_route_name.dart';
import 'package:flutter_mvvm_provider/utils/common_widgets.dart';
import 'package:go_router/go_router.dart';

class DefaultScreen extends StatelessWidget {
  const DefaultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: genericErrorWidget(
        error: GenericError(),
        onRefresh: (){
          context.push(AppRouteName.splash);
        }
      ),
    );
  }
}
