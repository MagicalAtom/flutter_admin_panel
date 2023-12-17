import 'package:get_it/get_it.dart';
import 'package:pocogame/bloc/Category/category_bloc.dart';
import 'package:pocogame/bloc/Post/post_bloc.dart';
import 'package:pocogame/bloc/Product/product_bloc.dart';
import 'package:pocogame/bloc/dashboard/dashboard_bloc.dart';
import 'package:pocogame/data/datasources/Category/category_datasource.dart';
import 'package:pocogame/data/datasources/Category/category_datasource_impl.dart';
import 'package:pocogame/data/datasources/Post/post_datasource.dart';
import 'package:pocogame/data/datasources/Post/post_datasource_impl.dart';
import 'package:pocogame/data/datasources/Product/product_datasource.dart';
import 'package:pocogame/data/datasources/Product/product_datasource_impl.dart';
import 'package:pocogame/data/repositories/Category/category_repository_impl.dart';
import 'package:pocogame/data/repositories/Product/product_repository.dart';
import 'package:pocogame/data/repositories/Product/product_repository_impl.dart';
import '../../data/repositories/Category/category_repository.dart';
import '../../data/repositories/Post/post_repository.dart';
import '../../data/repositories/Post/post_repository_impl.dart';

var ServiceLocator = GetIt.instance;

void initDashBoardBloc() {
  ServiceLocator.registerSingleton<DashboardBloc>(DashboardBloc());
}



// Post Section , (DataSource , Repositories)
void initPostDataSourceService() {
  ServiceLocator.registerSingleton<PostDataSourceInterFace>(PostDataSource());
}



void initPostRepositoriesService() {
  ServiceLocator.registerSingleton<PostRepositoryInterFace>(PostRepository());
}


void initPostBloc() {
  ServiceLocator.registerSingleton<PostBloc>(PostBloc());
}

// ===================== Category Section , (DataSource , Repository - Bloc)


void initCategoryDataSourceService(){
  ServiceLocator.registerSingleton<CategoryDataSourceInterFace>(CategoruDataSource());
}


void initCategoryRepositoryService(){
  ServiceLocator.registerSingleton<CategoryRepositoryInterFace>(CategoryRepository());
}

void initCategoryBloc() {
  ServiceLocator.registerSingleton<CategoryBloc>(CategoryBloc());
}


// ===================== Product Section , (DataSource , Repository - Bloc)
void initProductDataSourceService(){
  ServiceLocator.registerSingleton<ProductDataSourceInterFace>(ProductDataSource());
}
void initProductRepositoryService(){
  ServiceLocator.registerSingleton<ProductRepositoryInterFace>(ProductRepository());
}

void initProductBloc() {
  ServiceLocator.registerSingleton<ProductBloc>(ProductBloc());
}



Future<void> initAllServices() async {
  initDashBoardBloc();
  initPostDataSourceService();
  initPostRepositoriesService();
  initPostBloc();
  initCategoryDataSourceService();
  initCategoryRepositoryService();
  initCategoryBloc();
  initProductDataSourceService();
  initProductRepositoryService();
  initProductBloc();
}
