import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/Category/category_bloc.dart';
import 'package:pocogame/bloc/Post/post_bloc.dart';
import 'package:pocogame/di/admin/di.dart';
import 'package:pocogame/magicalUi/init.dart';
import 'package:pocogame/magicalUi/magic.dart';

import 'bloc/Product/Product_bloc.dart';

void main() async {
  await initAllServices();
  await Magic.init();
  runApp(AdminApplication());
}

class AdminApplication extends StatelessWidget {
  const AdminApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostBloc>(
            create: (context) => ServiceLocator.get<PostBloc>()),
        BlocProvider<CategoryBloc>(
            create: (context) => ServiceLocator.get<CategoryBloc>()),
        BlocProvider<ProductBloc>(
            create: (context) => ServiceLocator.get<ProductBloc>()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: route(context: context, name: 'dashboard')),
    );
  }
}
