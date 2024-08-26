part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageLoading extends HomePageState {}
class HomePageSuccess extends HomePageState {

   final BatteryInfo batteryInfo;

   HomePageSuccess({required this.batteryInfo});
}
class HomePageError extends HomePageState {
  String error;
  HomePageError({required this.error});
}