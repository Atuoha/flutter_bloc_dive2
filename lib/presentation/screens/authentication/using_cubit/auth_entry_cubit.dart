import 'package:flutter/material.dart';
import 'package:flutter_bloc_dive2/presentation/screens/authentication/using_cubit/screens/auth.dart';

import '../../../../constants/constants.dart';

class AuthEntryCubit extends StatelessWidget {
  const AuthEntryCubit({Key? key}) : super(key: key);
  static const routeName = '/auth_entry_cubit';

  void navigateToAuth({required bool isSignIn, required BuildContext context}) {
    //  todo implement navigateToAuth
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => AuthScreen(
          isSignIn: isSignIn,
        ),
      ),
    );
  }

  Widget kTextButton(
      {required bool isSignIn,
      required String title,
      required BuildContext context}) {
    return TextButton(
      onPressed: () => navigateToAuth(isSignIn: isSignIn, context: context),
      child: Text(
        title,
        style: TextStyle(color: primaryColor),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/entry.png'),
            const SizedBox(height: 10),
            Text(
              'Bloc Authentication',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: secondaryColor,
              ),
            )
          ],
        ),
      ),
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          kTextButton(isSignIn: true, title: 'Sign in', context: context),
          kTextButton(isSignIn: false, title: 'Sign up', context: context),
        ],
      ),
    );
  }
}
