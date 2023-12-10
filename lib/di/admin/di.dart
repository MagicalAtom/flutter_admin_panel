import 'package:get_it/get_it.dart';
import 'package:pocogame/bloc/Post/post_bloc.dart';
import 'package:pocogame/bloc/dashboard/dashboard_bloc.dart';
import 'package:pocogame/data/datasources/Post/post_datasource.dart';
import 'package:pocogame/data/datasources/Post/post_datasource_impl.dart';

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




Future<void> initAllServices() async {
  initDashBoardBloc();
  initPostDataSourceService();
  initPostRepositoriesService();
  initPostBloc();
}
