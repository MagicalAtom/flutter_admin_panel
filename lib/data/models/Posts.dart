import 'dart:convert';
class Post {

  String title;
  String text;
  String date;

  Post({
    required this.title,
    required this.text,
    required this.date,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'text': text,
      'date': date,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      title: map['title'] as String,
      text: map['text'] as String,
      date: map['date'] as String,
    );
  }

  String toJson() => json.encode(toMap());
}
