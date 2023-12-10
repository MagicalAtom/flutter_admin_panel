import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/Post/post_bloc.dart';
import 'package:pocogame/di/admin/di.dart';
import 'package:pocogame/magicalUi/init.dart';
import 'package:pocogame/magicalUi/magic.dart';

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
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: route(context: context, name: 'dashboard')),
    );
  }
}
