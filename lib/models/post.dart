import 'dart:convert';

import 'package:hive/hive.dart';

part 'post.g.dart';

@HiveType(typeId: 1)
class Post {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int userId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String body;

  const Post({
    this.id,
    this.userId,
    this.title,
    this.body,
  });

  Post copyWith({
    int id,
    int userId,
    String title,
    String body,
  }) {
    return Post(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userId': userId,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
      id: map['id'],
      userId: map['userId'],
      title: map['title'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Post.fromJson(String source) => Post.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Post(id: $id, userId: $userId, title: $title, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Post &&
            other.id == id &&
            other.userId == userId &&
            other.title == title &&
            other.body == body);
  }

  @override
  int get hashCode {
    return id.hashCode ^ userId.hashCode ^ title.hashCode ^ body.hashCode;
  }
}
