import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:pisatel_test_project/models/post.dart';
import 'package:pisatel_test_project/services/data_repository.dart';

part 'post_state.dart';

class PostsCubit extends Cubit<PostState> {
  PostsCubit() : super(PostLoading());
  void load() async {
    try {
      emit(PostLoading());
      final posts = await DataRepository().getPosts();
      emit(PostLoaded(items: posts));
    } catch (error) {
      emit(PostError(message: 'Error loading posts'));
    }
  }
}
