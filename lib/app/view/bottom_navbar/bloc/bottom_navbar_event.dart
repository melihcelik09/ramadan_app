part of 'bottom_navbar_bloc.dart';

abstract class BottomNavbarEvent extends Equatable {
  const BottomNavbarEvent();

  @override
  List<Object> get props => [];
}

class BottomNavbarInitialEvent extends BottomNavbarEvent {}

class BottomNavbarEventChange extends BottomNavbarEvent {
  final int index;

  const BottomNavbarEventChange({required this.index});

  @override
  List<Object> get props => [index];
}
