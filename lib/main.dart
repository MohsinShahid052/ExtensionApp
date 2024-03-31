import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:checkingapp/internetConnectivity/internetconnectivity.dart';
import 'package:checkingapp/Drawer/dashboard.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: DrawerClass(),
    );
  }
}
