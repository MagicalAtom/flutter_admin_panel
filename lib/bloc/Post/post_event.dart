part of 'post_bloc.dart';

abstract class PostEvent {}

class PostRequestEvent extends PostEvent {

  int Page;
  PostRequestEvent({required this.Page});

}

class PostAddEvent extends PostEvent {
  final title;
  final text;
  final date;
  final thumbnail;

  PostAddEvent(
      {required this.title,
      required this.text,
      required this.date,
      required this.thumbnail});
}


class PostDeleteEvent extends PostEvent {
  Post post;
  PostDeleteEvent({required this.post});
}


