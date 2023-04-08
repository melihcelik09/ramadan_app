import 'dart:async';
import 'dart:html';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>(_fetchEvent);
  }

  FutureOr<void> _fetchEvent(event, emit) {
    emit(HomeLoading());
    if (event is FetchEvent) {}
  }
}
