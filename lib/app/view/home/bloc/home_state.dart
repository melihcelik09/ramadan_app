part of 'home_bloc.dart';

@immutable
abstract class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

class HomeInitial extends HomeState {}

class HomeLoading extends HomeState {}

class HomeLoaded extends HomeState {
  final DailyWeatherModel model;

  const HomeLoaded({required this.model});

  @override
  List<Object> get props => [model];
}

class HomeError extends HomeState {
  final String message;

  const HomeError({this.message = 'Something went wrong'});

  @override
  List<Object> get props => [message];
}

class HomeEmpty extends HomeState {}
