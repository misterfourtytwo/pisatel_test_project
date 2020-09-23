import 'dart:convert';

import 'package:hive/hive.dart';

part 'comment.g.dart';

@HiveType(typeId: 2)
class Comment {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int postId;
  @HiveField(2)
  final String name;
  @HiveField(3)
  final String email;
  @HiveField(4)
  final String body;

  const Comment({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  Comment copyWith({
    int postId,
    int id,
    String name,
    String email,
    String body,
  }) {
    return Comment(
      postId: postId ?? this.postId,
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      body: body ?? this.body,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Comment(
      postId: map['postId'],
      id: map['id'],
      name: map['name'],
      email: map['email'],
      body: map['body'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Comment(postId: $postId, id: $id, name: $name, email: $email, body: $body)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Comment &&
            other.postId == postId &&
            other.id == id &&
            other.name == name &&
            other.email == email &&
            other.body == body);
  }

  @override
  int get hashCode {
    return postId.hashCode ^
        id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        body.hashCode;
  }
}
