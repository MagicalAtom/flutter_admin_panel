part of 'product_bloc.dart';


abstract class ProductEvent {}

class ProductRequestEvent extends ProductEvent {
  final int Page;
  ProductRequestEvent({required this.Page});
}

class ProductAddEvent extends ProductEvent {
  final name;
  final description;
  final price;
  final quantity;
  final thumbnail;
  final category;

  ProductAddEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.category,
    required this.thumbnail,
  });
}

class ProductDeleteEvent extends ProductEvent {
  final int Product;
  ProductDeleteEvent({required this.Product});
}

class ProductUpdateEvent extends ProductEvent {
  final name;
  final description;
  final price;
  final quantity;
  final thumbnail;
  final category;
  final id;
  final discountPrice;
  final popularity;

  ProductUpdateEvent({
    required this.name,
    required this.description,
    required this.price,
    required this.quantity,
    required this.thumbnail,
    required this.category,
    required this.id,
    required this.discountPrice,
    required this.popularity,
  });
}

class ProductRequestProductEvent extends ProductEvent {}
