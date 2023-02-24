import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String id;
  final String fullname;
  final String email;
  final String imgUrl;
  final String rank;
  final int point;

  const User({
    required this.id,
    required this.fullname,
    required this.email,
    required this.imgUrl,
    required this.rank,
    required this.point,
  });

  @override
  List<Object?> get props => [id, fullname, email, imgUrl, rank, point];

  @override
  String toString() =>
      'User{id: $id, fullname: $fullname, email: $email, imgUrl: $imgUrl, rank: $rank, point: $point}';

  User copyWith({
    String? id,
    String? fullname,
    String? email,
    String? imgUrl,
    String? rank,
    int? point,
  }) {
    return User(
      id: id ?? this.id,
      fullname: fullname ?? this.fullname,
      email: email ?? this.email,
      imgUrl: imgUrl ?? this.imgUrl,
      rank: rank ?? this.rank,
      point: point ?? this.point,
    );
  }
}
