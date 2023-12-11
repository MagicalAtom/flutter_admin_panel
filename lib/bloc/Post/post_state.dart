part of 'post_bloc.dart';

abstract class PostState {}

final class PostInitial extends PostState {}


final class PostLoadingState extends PostState {}




final class PostRequestResponseState extends PostState {
  Either<String,List<Post>> postList;
  PostRequestResponseState({required this.postList});
}




final class PostAddState extends PostState {
  Either<String,String> postCreateStatus;
  PostAddState({required this.postCreateStatus});
}





