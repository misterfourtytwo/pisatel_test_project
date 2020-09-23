import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pisatel_test_project/models/comment.dart';
import 'package:pisatel_test_project/models/post.dart';
import 'package:pisatel_test_project/services/data_repository.dart';

part 'comment_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  final Post post;
  CommentsCubit(this.post) : super(CommentsLoading());
  void load() async {
    try {
      emit(CommentsLoading());
      final comments = await DataRepository().getComments(post);
      emit(CommentsLoaded(items: comments));
    } catch (error) {
      emit(CommentsError(message: 'Error loading posts'));
    }
  }
}
