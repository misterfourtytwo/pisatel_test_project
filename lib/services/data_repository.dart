import 'package:hive/hive.dart';
import 'package:pisatel_test_project/models/comment.dart';
import 'package:pisatel_test_project/models/photo.dart';
import 'package:pisatel_test_project/models/post.dart';
import 'package:pisatel_test_project/services/api_client.dart';

class DataRepository {
  static const String boxName = 'data_repository';
  static DataRepository _instance;
  final Box<dynamic> _box;
  DataRepository._() : _box = Hive.box(boxName);
  factory DataRepository() => _instance ??= DataRepository._();

  // get post list
  Future<List<Post>> getPosts() async {
    if (_box.get('posts')?.isNotEmpty == true)
      return List<Post>.from(_box.get('posts'));
    final List<Post> posts = await ApiClient.fetchPosts();
    await _box.put('posts', posts);
    return posts;
  }

  /// get comments for the specified post
  Future<List<Comment>> getComments(Post post) async {
    if (_box.get('comments#${post.id}')?.isNotEmpty == true)
      return List<Comment>.from(_box.get('comments#${post.id}'));
    final List<Comment> comments = await ApiClient.fetchComments(post);
    await _box.put('comments#${post.id}', comments);
    return comments;
  }

  /// get photo
  Future<Photo> getPhoto(Post post) async {
    if (_box.get('photo#${post.id}')?.isNotEmpty == true)
      return (_box.get('photo#${post.id}') as Photo);
    final Photo photo = await ApiClient.fetchPhoto(post);
    await _box.put('photo#${post.id}', photo);
    return photo;
  }
}
