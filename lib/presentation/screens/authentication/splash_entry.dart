import 'dart:async';

import 'package:flutter/material.dart';
import 'widgets/loading.dart';

class SplashEntry extends StatefulWidget {
  const SplashEntry({Key? key}) : super(key: key);
  static const routeName = '/splash_entry';

  @override
  State<SplashEntry> createState() => _SplashEntryState();
}

class _SplashEntryState extends State<SplashEntry> {
  @override
  void initState() {
    Timer(const Duration(seconds: 10), () {
      // todo
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/splash_img.png'),
            const SizedBox(height: 20),
            const LoadingWidget()
          ],
        ),
      ),
    );
  }
}
