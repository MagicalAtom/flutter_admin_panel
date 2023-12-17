part of 'product_bloc.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoadingState extends ProductState {}

class ProductRequestResponseState extends ProductState {
  final Either<String, List<Product>> productList;
  final int Page = 1;
  ProductRequestResponseState({required this.productList});
}

class ProductAddState extends ProductState {
  final Either<String, String> productCreateStatus;
  ProductAddState({required this.productCreateStatus});
}

class ProductDeleteState extends ProductState {}

class ProductUpdatedState extends ProductState {
  final Either<String, String> productUpdateStatus;
  ProductUpdatedState({required this.productUpdateStatus});
}

class ProductRequestResponseForCreatePostState extends ProductState {
  final Either<String, List> categoriesList;
  ProductRequestResponseForCreatePostState({required this.categoriesList});
}
