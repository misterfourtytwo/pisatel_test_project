import 'dart:convert';

import 'package:hive/hive.dart';

part 'photo.g.dart';

@HiveType(typeId: 3)
class Photo {
  @HiveField(0)
  final int id;
  @HiveField(1)
  final int albumId;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String url;
  @HiveField(4)
  final String thumbnailUrl;

  Photo({
    this.albumId,
    this.id,
    this.title,
    this.url,
    this.thumbnailUrl,
  });

  Photo copyWith({
    int albumId,
    int id,
    String title,
    String url,
    String thumbnailUrl,
  }) {
    return Photo(
      albumId: albumId ?? this.albumId,
      id: id ?? this.id,
      title: title ?? this.title,
      url: url ?? this.url,
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Photo(
      albumId: map['albumId'],
      id: map['id'],
      title: map['title'],
      url: map['url'],
      thumbnailUrl: map['thumbnailUrl'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Photo.fromJson(String source) => Photo.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Photo(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other is Photo &&
            other.albumId == albumId &&
            other.id == id &&
            other.title == title &&
            other.url == url &&
            other.thumbnailUrl == thumbnailUrl);
  }

  @override
  int get hashCode {
    return albumId.hashCode ^
        id.hashCode ^
        title.hashCode ^
        url.hashCode ^
        thumbnailUrl.hashCode;
  }
}
