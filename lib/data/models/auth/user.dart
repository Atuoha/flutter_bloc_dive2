import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class User extends Equatable {
  final String id;
  final String fullname;
  final String email;
  final String profileImg;
  final String phone;
  final String rank;
  final int point;
  final String authType;

  const User(
      {required this.id,
      required this.fullname,
      required this.email,
      required this.profileImg,
      required this.phone,
      required this.rank,
      required this.point,
      this.authType = 'Email/Password'});

  factory User.fromDoc(DocumentSnapshot userDoc) {
    final userData = userDoc.data() as Map<String, dynamic>;

    return User(
      id: userDoc.id,
      fullname: userData['fullname'],
      email: userData['email'],
      profileImg: userData['profileImg'],
      phone: userData['phone'],
      rank: userData['rank'],
      point: userData['point'],
      authType: userData['authType'],
    );
  }

  factory User.initial() {
    return const User(
      id: '',
      fullname: '',
      email: '',
      profileImg: '',
      phone: '',
      rank: '',
      point: -1,
      authType: 'Email/Password',
    );
  }

  @override
  List<Object?> get props =>
      [id, fullname, email, profileImg, phone, rank, point, authType];

  @override
  String toString() =>
      'User{id: $id, fullname: $fullname, email: $email, imgUrl: $profileImg, phone: $phone, rank: $rank, point: $point,authType: $authType}';

  User copyWith({
    String? id,
    String? fullname,
    String? email,
    String? profileImg,
    String? phone,
    String? rank,
    int? point,
    String? authType,
  }) {
    return User(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      profileImg: profileImg ?? this.profileImg,
      phone: phone ?? this.phone,
      rank: rank ?? this.rank,
      point: point ?? this.point,
      authType: authType ?? this.authType,
    );
  }
}
