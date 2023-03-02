import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as fbauth;
import '../constants/constants.dart';
import '../data/models/auth/custom_error.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository {
  final FirebaseFirestore firebaseFirestore;
  final fbauth.FirebaseAuth firebaseAuth;

  AuthRepository({required this.firebaseFirestore, required this.firebaseAuth});

  Stream<fbauth.User?> get user => firebaseAuth.userChanges();

  // Sign up
  Future<void> signUp({
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      fbauth.UserCredential credential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await userRef.doc(credential.user!.uid).set({
        'id': credential.user!.uid,
        'email': email,
        'phone': phone,
        'profileImg': 'https://media.istockphoto.com/id/1223671392/vector/default-profile-picture-avatar-photo-placeholder-vector-illustration.jpg?s=612x612&w=0&k=20&c=s0aTdmT5aU6b8ot7VKm11DeID6NctRCpB755rA1BIP0=',
        'point': 0,
        'rank': 'bronze',
        'authType': 'Email/Password',
      });
    } on fbauth.FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, errMsg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
          code: 'Exception',
          errMsg: e.toString(),
          plugin: 'firebase_exception/server_error');
    }
  }

  // Sign in
  Future<void> signIn({required String email, required String password}) async {
    try {
      await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on fbauth.FirebaseAuthException catch (e) {
      print('FROM REPO: Error occured ${e.message}');
      throw CustomError(
          code: e.code, errMsg: e.message.toString(), plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        errMsg: e.toString(),
        plugin: 'firebase_exception/server_error',
      );
    }
  }

  // Google authenticate
  Future<void> googleAuthenticate() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication googleAuth =
          await googleUser!.authentication;

      final credential = fbauth.GoogleAuthProvider.credential(
        idToken: googleAuth.idToken,
        accessToken: googleAuth.accessToken,
      );

      final logCredentials =
          await firebaseAuth.signInWithCredential(credential);
      final user = logCredentials.user;

      userRef.doc(user!.uid).set({
        'id': user.displayName,
        'email': user.email,
        'phone': user.phoneNumber,
        'profileImg': user.photoURL,
        'point': 0,
        'rank': 'bronze',
        'authType': 'GoogleAuth',
      });
    } on fbauth.FirebaseAuthException catch (e) {
      throw CustomError(code: e.code, errMsg: e.message!, plugin: e.plugin);
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        errMsg: e.toString(),
        plugin: 'firebase_exception/server_error',
      );
    }
  }

  // sign out
  Future<void> signOut() async {
    try {
      await firebaseAuth.signOut();
    } catch (e) {
      throw CustomError(
        code: 'Exception',
        errMsg: e.toString(),
        plugin: 'firebase_exception/server_error',
      );
    }
  }
}
