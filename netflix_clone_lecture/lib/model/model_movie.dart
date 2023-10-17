import 'package:cloud_firestore/cloud_firestore.dart';

class Movie {
  final String title;
  final String keyword;
  final String poster;
  final bool like;
  final DocumentReference reference;

  Movie.fromMap(Map<String, dynamic> map, {required this.reference}) // 파라미터 reference추가됨
      : title = map['title'],
        keyword = map['keyword'],
        poster = map['poster'],
        like = map['like'];

  Movie.fromSnapshot(DocumentSnapshot snapshot)
      : this.fromMap(snapshot.data() as Map<String, dynamic>, reference: snapshot.reference);
      // data에 ()데이터 메소드 형태로 불러와야함
      // as Map이 추가됨 위에서 있는것을 받은 것

  @override
  String toString() => "Movie<$title:$keyword>";
}