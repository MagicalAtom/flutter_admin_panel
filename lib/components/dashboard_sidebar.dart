import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pocogame/bloc/dashboard/dashboard_bloc.dart';
import 'package:pocogame/config/color.dart';
import 'package:pocogame/widgets/sidebar_item_widget.dart';

class DashBoardSideBar extends StatefulWidget {
  const DashBoardSideBar({super.key});

  @override
  State<DashBoardSideBar> createState() => _DashBoardSideBarState();
}

class _DashBoardSideBarState extends State<DashBoardSideBar> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: ColorConfig.second,
        child: ListView(
          padding: const EdgeInsets.only(top: 10),
          children: [
            SideBarItem(
              title: 'Posts',
              icon: const Icon(
                Icons.article_outlined,
                color: ColorConfig.second,
                size: 26,
              ),
              onTapItem: () {
                context.read<DashboardBloc>().add(openDashBoardTab(tab: 0));
              },
            ),
            SideBarItem(
              title: 'Users',
              icon: const Icon(
                Icons.man_rounded,
                color: ColorConfig.second,
                size: 26,
              ),
              onTapItem: () {
                context.read<DashboardBloc>().add(openDashBoardTab(tab: 0));
              },
            ),
            SideBarItem(
              title: 'Product',
              icon: const Icon(
                Icons.card_travel,
                color: ColorConfig.second,
                size: 26,
              ),
              onTapItem: () {
                context.read<DashboardBloc>().add(openDashBoardTab(tab: 1));
              },
            ),
            SideBarItem(
              title: 'Category',
              icon: const Icon(
                Icons.category,
                color: ColorConfig.second,
                size: 26,
              ),
              onTapItem: () {
                context.read<DashboardBloc>().add(openDashBoardTab(tab: 1));
              },
            ),
            SideBarItem(
              title: 'Comments',
              icon: const Icon(
                Icons.comment,
                color: ColorConfig.second,
                size: 26,
              ),
              onTapItem: () {
                context.read<DashboardBloc>().add(openDashBoardTab(tab: 1));
              },
            ),
            SideBarItem(
              title: 'Home Slider',
              icon: const Icon(
                Icons.slideshow_rounded,
                color: ColorConfig.second,
                size: 26,
              ),
              onTapItem: () {
                context.read<DashboardBloc>().add(openDashBoardTab(tab: 1));
              },
            ),
            SideBarItem(
              title: 'Settings',
              icon: const Icon(
                Icons.settings,
                color: ColorConfig.second,
                size: 26,
              ),
              onTapItem: () {
                context.read<DashboardBloc>().add(openDashBoardTab(tab: 1));
              },
            ),
          ],
        ),
      ),
    );
  }
}
