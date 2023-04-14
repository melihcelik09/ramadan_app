part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable {
  const HomeEvent();

  @override
  List<Object> get props => [];
}

class HomeFetchEvent extends HomeEvent {}

class HomeRefreshEvent extends HomeEvent {}
