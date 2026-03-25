import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/dependency_injection/locator.dart';
import 'package:flutter_mvvm_provider/helpers/analytics_helper.dart';
import 'package:flutter_mvvm_provider/utils/custom_log.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {

  final AnalyticsHelper analyticsHelper = locator<AnalyticsHelper>();

  @override
  void initState() {
    super.initState();
    logScreenView();
  }


  void logScreenView() {
    analyticsHelper.logScreenView(widget.toString(), T.toString());
  }

  @override
  void dispose() {
    // TODO: implement dispose
    CustomLog.info(this, "Disposed Called");
    super.dispose();
  }

}