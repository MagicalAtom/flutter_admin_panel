part of 'dashboard_bloc.dart';

abstract class DashboardState {}

final class DashboardInitial extends DashboardState {}

final class DashboardTabIndexState extends DashboardState{
  int tab;
  DashboardTabIndexState({required this.tab});
}