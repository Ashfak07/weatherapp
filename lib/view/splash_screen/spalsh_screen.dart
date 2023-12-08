import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:weatherapp/view/location_select/location_select.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3)).then((value) =>
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => LocationSelect()),
            (route) => false));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 222, 177, 228),
      body: Center(
          child: LottieBuilder.asset(
              'assets/lottie/Animation - 1702057341842.json')),
    );
  }
}
