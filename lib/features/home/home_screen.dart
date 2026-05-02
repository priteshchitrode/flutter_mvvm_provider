import 'package:flutter/material.dart';
import 'package:flutter_mvvm_provider/utils/app_text_style.dart';
import 'package:flutter_mvvm_provider/utils/extensions/widget_extensions.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen.shade100,
      body: SafeArea(child: Text("Home", style: AppTextStyle.h1).center()),
    );
  }
}
