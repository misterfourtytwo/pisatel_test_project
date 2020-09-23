import 'package:dio/dio.dart';
import 'package:pisatel_test_project/models/comment.dart';
import 'package:pisatel_test_project/models/photo.dart';
import 'package:pisatel_test_project/models/post.dart';

class ApiClient {
  static Dio _dio = new Dio();
  static const String _baseUrl = 'https://jsonplaceholder.typicode.com/';

  /// fetch posts
  static Future<List<Post>> fetchPosts() async {
    print('api: fetch posts');
    final String endpoint = 'posts/';
    final result = await _dio.get<dynamic>(
      _baseUrl + endpoint,
    );
    print(result);
    return result.data.map<Post>((dynamic post) => Post.fromMap(post)).toList();
  }

  static Future<List<Comment>> fetchComments(Post post) async {
    print('api: fetch comments');
    final String endpoint = 'posts/${post.id}/comments';
    final result = await _dio.get<dynamic>(
      _baseUrl + endpoint,
    );

    return result.data
        .map<Comment>((dynamic post) => Comment.fromMap(post))
        .toList();
  }

  static Future<Photo> fetchPhoto(Post post) async {
    print('api: fetch photos');
    final String endpoint = 'posts/${post.id}/photos';
    final result = await _dio.get(
      _baseUrl + endpoint,
    );
    return result.data
        .map<Photo>((dynamic photo) => Photo.fromMap(photo))
        .first;
  }
}
