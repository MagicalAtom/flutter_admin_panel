import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/dashboard/dashboard_bloc.dart';
import 'package:pocogame/config/color.dart';



import '../config/screens.dart';

class DashBoardContent extends StatelessWidget {
   DashBoardContent({super.key});



  @override
  Widget build(BuildContext context) {

    return Expanded(
      flex: 5,
      /*
      هر بار درخواستی یا ایونتی مبنی بر تغییر صفحه بره سمت بلاک اینجا با بلاک بیلدر کل
      صفحه آپدیت میشه .
      ایندکس صفحه مورد نظر رو تو ساید بار مشخص کردیم
      بعد اینجا از سمت استیت میاره اینجا نشون میده 
       */
      child: BlocBuilder<DashboardBloc,DashboardState>(
        builder: (context, state) {
          return Container(
              color: ColorConfig.main,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if(state is DashboardTabIndexState)...[
                    Expanded(child: screens[state.tab])
                  ]
                ],
              ),
            );
        },
      ),
    );
  }
}
