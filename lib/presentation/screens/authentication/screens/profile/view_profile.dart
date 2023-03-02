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
            return const LoadingWidget();
          }
          return Column(
            children: [
              Image.network(''),
            ],
          );
        },
      ),
    );
  }
}
