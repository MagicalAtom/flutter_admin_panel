class Category {
  String title;
  String id;
  int pageCount;

  Category({
    required this.title,
    required this.id,
    required this.pageCount,
});


  factory Category.fromMap(Map<String, dynamic> map,id,pageCount) {
    return Category(
      title: map['title'] as String,
      id: id as String,
      pageCount:  pageCount,
    );
  }

}