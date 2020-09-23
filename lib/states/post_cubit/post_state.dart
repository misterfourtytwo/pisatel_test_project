part of 'post_cubit.dart';

@immutable
abstract class PostState {
  const PostState();
}

class PostLoaded extends PostState {
  final List<Post> items;

  const PostLoaded({this.items});
}

class PostLoading extends PostState {}

class PostError extends PostState {
  final String message;

  const PostError({this.message = 'Unknown error'});
}
