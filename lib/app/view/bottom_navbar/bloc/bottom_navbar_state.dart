part of 'bottom_navbar_bloc.dart';

abstract class BottomNavbarState extends Equatable {
  const BottomNavbarState();
  BottomNavbarState copyWith();
  @override
  List<Object> get props => [];
}

class BottomNavbarInitial extends BottomNavbarState {
  final int currentPage;
  final List<Widget> pages;

  const BottomNavbarInitial({this.currentPage = 0, required this.pages});

  @override
  BottomNavbarInitial copyWith({int? currentPage, List<Widget>? pages}) {
    return BottomNavbarInitial(
      currentPage: currentPage ?? this.currentPage,
      pages: pages ?? this.pages,
    );
  }

  @override
  List<Object> get props => [currentPage, pages];
}
