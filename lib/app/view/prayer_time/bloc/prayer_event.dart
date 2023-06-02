part of 'prayer_bloc.dart';

abstract class PrayerEvent extends Equatable {
  const PrayerEvent();

  @override
  List<Object> get props => [];
}

class PrayerFetchEvent extends PrayerEvent {}

class PrayerSelectedEvent extends PrayerEvent {
  final int index;

  const PrayerSelectedEvent({required this.index});

  @override
  List<Object> get props => [index];
}
