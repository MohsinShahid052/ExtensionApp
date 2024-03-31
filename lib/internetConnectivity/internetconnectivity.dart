import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class InternetConnectivity extends StatefulWidget {
  const InternetConnectivity({Key? key}) : super(key: key);

  @override
  State<InternetConnectivity> createState() => _InternetConnectivityState();
}

class _InternetConnectivityState extends State<InternetConnectivity> {
  int internetChanged = 0;

  @override
  void initState() {
    super.initState();
    InternetConnectionChecker().onStatusChange.listen((status) {
      debugPrint(status.toString());
      switch (status) {
        case InternetConnectionStatus.connected:
          if (internetChanged == 1) {
            Get.snackbar(
              "Internet is back",
              "Great, your internet connection is restored.",
              icon: const Icon(
                Icons.signal_wifi_4_bar_lock_rounded,
                color: Colors.green,
              ),
              backgroundColor: Colors.white,
              colorText: Colors.green[900],
            );
            setState(() {
              internetChanged = 0;
            });
          }
          break;
        case InternetConnectionStatus.disconnected:
          setState(() {
            internetChanged++;
          });
          Get.snackbar(
            "No Internet Connection",
            "Please check your internet.",
            icon: const Icon(
              Icons.signal_wifi_statusbar_connected_no_internet_4_rounded,
              color: Colors.red,
            ),
            backgroundColor: Colors.white,
            colorText: Colors.red[900],
          );
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
