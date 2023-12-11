import 'dart:convert';
class Post {
  String title;
  String text;
  String date;
  String id;
  int pageCount;
  Post({
    required this.title,
    required this.text,
    required this.date,
    required this.id,
    required this.pageCount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'text': text,
      'date': date,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map,id,pageCount) {
    return Post(
      title: map['title'] as String,
      text: map['text'] as String,
      date: map['date'] as String,
      id: id as String,
      pageCount:  pageCount,
    );
  }

  String toJson() => json.encode(toMap());
}
