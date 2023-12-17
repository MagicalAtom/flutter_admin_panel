import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:pocogame/data/models/Product.dart';
import 'package:pocogame/data/repositories/Product/product_repository_impl.dart';
import 'package:pocogame/di/admin/di.dart';


part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
    final ProductRepositoryInterFace ProductRepository = ServiceLocator.get();

  ProductBloc() : super(ProductInitial()) {

    
    on<ProductRequestEvent>((event, emit) async {
      emit(ProductLoadingState());
      Either<String, List<Product>> ProductList =
      await ProductRepository.getAllProductFromApi(event.Page);
      emit(ProductRequestResponseState(productList: ProductList));
    });

    on<ProductAddEvent>((event, emit) async {
      emit(ProductLoadingState());
      Either<String, String> ProductCreateStatus = await ProductRepository.newProduct(event.name,event.description,event.price,event.quantity,event.category,event.thumbnail);
      emit(ProductAddState(productCreateStatus: ProductCreateStatus));
    });

    on<ProductDeleteEvent>((event, emit) async {
      Either<String, String> ProductDeleteStatus =
      await ProductRepository.deleteProduct(product: event.Product);
      emit(ProductDeleteState());
    });

    on<ProductUpdateEvent>((event, emit) async {
      emit(ProductLoadingState()); // این رو نشون میده روش منتظر میمونه تا مرحله بعد انجام بشه
      Either<String, String> ProductUpdatedStatus = await ProductRepository
          .updateProduct(event.name,event.description,event.price,event.quantity,event.category,event.popularity,event.discountPrice,event.id);
      emit(ProductUpdatedState(productUpdateStatus: ProductUpdatedStatus));
    });

  }
}
