import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/constants.dart';
import '../data/models/auth/custom_error.dart';
import '../data/models/auth/user.dart';

class ProfileRepository {
  final FirebaseFirestore firebaseFirestore;

  ProfileRepository({required this.firebaseFirestore});

  Future<User> getProfile({required String uId}) async {
    try {
      final DocumentSnapshot userDoc = await userRef.doc(uId).get();

      if(userDoc.exists){
        final currentUser = User.fromDoc(userDoc);
        return currentUser;
      }
      throw 'User not found';
    } on FirebaseException catch (e) {
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
