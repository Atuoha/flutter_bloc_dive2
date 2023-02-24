import 'package:flutter/material.dart';

class AuthEntryCubit extends StatelessWidget {
  const AuthEntryCubit({Key? key}) : super(key: key);
  static const routeName = '/auth_entry_cubit';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/entry.png'),
          ],
        ),
      ),
    );
  }
}
