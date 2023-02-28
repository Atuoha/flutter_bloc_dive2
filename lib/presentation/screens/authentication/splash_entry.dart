import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/presentation/screens/authentication/screens/auth_flow/auth.dart';
import 'package:flutter_bloc_dive2/presentation/screens/authentication/screens/home.dart';
import '../../../business_logic/authentication/auth/auth_bloc.dart';
import 'widgets/loading.dart';
import 'package:flutter_bloc_dive2/constants/enums/auth_status.dart';

class SplashEntry extends StatefulWidget {
  const SplashEntry({Key? key}) : super(key: key);
  static const routeName = '/splash_entry';

  @override
  State<SplashEntry> createState() => _SplashEntryState();
}

class _SplashEntryState extends State<SplashEntry> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state.authStatus == AuthStatus.unauthenticated) {
            // unauthenticated
            Timer(const Duration(seconds: 10), () {
              Navigator.of(context).pushNamed(AuthScreen.routeName);
            });
          } else {
            // authenticated
            Timer(const Duration(seconds: 10), () {
              Navigator.of(context).pushNamed(AuthHomeScreen.routeName);
            });
          }
        },
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/splash_img.png'),
                const SizedBox(height: 20),
                const LoadingWidget()
              ],
            ),
          );
        },
      ),
    );
  }
}
