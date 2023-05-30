import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'prayer_event.dart';
part 'prayer_state.dart';

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  PrayerBloc() : super(PrayerInitial()) {
    on<PrayerEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
