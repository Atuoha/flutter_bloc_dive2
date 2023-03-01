import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../data/models/auth/custom_error.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;

  ProfileRepository({required this.firebaseFirestore});

  Future<void> getProfile({required String uId}) async {
    try {
      firebaseFirestore.collection('users').doc(uId);
    } on FirebaseAuthException catch (e) {
      throw CustomError(
          code: e.code, errMsg: e.message.toString(), plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          errMsg: e.toString(),
          plugin: 'flutter_exception/error');
    }
  }
}
