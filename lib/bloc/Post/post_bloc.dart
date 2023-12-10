import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:pocogame/data/models/Posts.dart';
import 'package:pocogame/data/repositories/Post/post_repository_impl.dart';
import 'package:pocogame/di/admin/di.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepositoryInterFace postRepository = ServiceLocator.get();

  PostBloc() : super(PostInitial()) {
    on<PostRequestEvent>((event, emit) async {
      emit(PostLoadingState());
      Either<String, List<Post>> postList =
          await postRepository.getAllPostFromApi();
      emit(PostRequestResponseState(postList: postList));
    });

    on<PostAddEvent>((event, emit) async {
      emit(PostLoadingState());
      Either<String, String> postCreateStatus = await postRepository.newPost(
          event.title, event.date, event.text, event.thumbnail);

      emit(PostAddState(postCreateStatus: postCreateStatus));
    });
  }
}
