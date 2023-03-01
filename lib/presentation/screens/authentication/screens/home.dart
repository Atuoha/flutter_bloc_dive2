import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/presentation/screens/authentication/screens/profile/view_profile.dart';
import '../../../../business_logic/authentication/auth/auth_bloc.dart';

class AuthHomeScreen extends StatelessWidget {
  const AuthHomeScreen({Key? key}) : super(key: key);
  static const routeName = '/auth_home_screen';

  Future showLogoutDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Logout'),
        content: const Text('Are you sure you want to logout?'),
        actions: [
          TextButton(
            onPressed: () => signOut(context),
            child: const Text('Ok'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  void signOut(BuildContext context) {
    context.read<AuthBloc>().add(SignOutEvent());
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text('Auth Home'),
          actions: [
            IconButton(
              onPressed: () =>
                  Navigator.of(context).pushNamed(ProfileScreen.routeName),
              icon: const Icon(Icons.person),
            ),
            IconButton(
              onPressed: () => showLogoutDialog(context),
              icon: const Icon(Icons.logout),
            ),
          ],
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                          'https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/open_graph.png'),
                    ),
                    const SizedBox(height: 10),
                    const Text('Bloc Authentication using Firebase ')
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
