import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dive2/presentation/screens/authentication/screens/settings.dart';

import '../../../../../business_logic/authentication/auth/auth_bloc.dart';
import '../../../../../business_logic/authentication/profile/profile_cubit.dart';
import '../../../../../constants/enums/process_status.dart';
import '../../../weather/using_bloc/components/error_dialog.dart';
import '../../widgets/loading.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  static const routeName = '/profile';

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  void initState() {
    getProfile();
    super.initState();
  }

  void getProfile() {
    final String uId = context.read<AuthBloc>().state.user!.uid;
    context.read<ProfileCubit>().getProfile(uId: uId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(SettingsScreen.routeName),
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: BlocConsumer<ProfileCubit, ProfileState>(
        listener: (context, state) {
          if (state.status == ProcessStatus.error) {
            errorDialog(context: context, errMsg: state.error.errMsg);
          }
        },
        builder: (context, state) {
          if (state.status == ProcessStatus.initial) {
            return const SizedBox.shrink();
          }
          if (state.status == ProcessStatus.loading) {
            return const Center(child: LoadingWidget());
          }

          if (state.status == ProcessStatus.error) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('assets/images/error3.gif'),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Opps! Error occurred, try again',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            );
          }
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Center(
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: NetworkImage(state.user.profileImg),
                  ),
                ),
                const SizedBox(height: 20),
                buildWrap(title: 'Fullname', data: state.user.fullname),
                buildWrap(title: 'Email', data: state.user.email),
                buildWrap(title: 'Phone Number', data: state.user.phone),
                buildWrap(title: 'Rank', data: state.user.rank),
                buildWrap(title: 'Points', data: '${state.user.point} points'),
              ],
            ),
          );
        },
      ),
    );
  }

  ListTile buildWrap({required String title, required String data}) {
    return ListTile(
      trailing: const Icon(Icons.chevron_right),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Text(data),
    );
  }
}
