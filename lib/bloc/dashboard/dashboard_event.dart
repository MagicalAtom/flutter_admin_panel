part of 'dashboard_bloc.dart';

abstract class DashboardEvent {}

final class openDashBoardTab extends DashboardEvent {
  int tab;
  openDashBoardTab({required this.tab}); // get tab index from DashboardSideBar and send to state for using DashBoardContent in change tab index
}