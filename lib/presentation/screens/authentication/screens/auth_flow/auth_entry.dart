import 'package:flutter/material.dart';
import 'auth.dart';

import '../../../../../constants/constants.dart';

class AuthEntry extends StatelessWidget {
  const AuthEntry({Key? key}) : super(key: key);
  static const routeName = '/auth_entry';

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
      backgroundColor: Colors.white,
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
