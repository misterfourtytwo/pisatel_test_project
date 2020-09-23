part of 'comment_cubit.dart';

@immutable
abstract class CommentsState {
  const CommentsState();
}

class CommentsLoaded extends CommentsState {
  final List<Comment> items;
  const CommentsLoaded({this.items});
}

class CommentsLoading extends CommentsState {}

class CommentsError extends CommentsState {
  final String message;

  const CommentsError({this.message = 'Unknown error'});
}
