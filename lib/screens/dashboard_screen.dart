import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/dashboard/dashboard_bloc.dart';
import 'package:pocogame/components/AppBar.dart';
import 'package:pocogame/components/dashboard_content.dart';
import 'package:pocogame/components/dashboard_sidebar.dart';
import 'package:pocogame/di/admin/di.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(),
      body: Row(
        children: [

          // handle Click SideBar
          BlocProvider<DashboardBloc>.value(
            value: ServiceLocator.get<DashboardBloc>(),
            child: const DashBoardSideBar(),
          ),

          // change content after click element in sidebar
          BlocProvider<DashboardBloc>(
            create: (context) => ServiceLocator.get<DashboardBloc>(),
            child: DashBoardContent(),
          ),




        ],
      ),
    );
  }
}
