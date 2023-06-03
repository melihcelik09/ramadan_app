part of 'prayer_bloc.dart';

abstract class PrayerEvent extends Equatable {
  const PrayerEvent();

  @override
  List<Object> get props => [];
}

class LoadPrayerEvent extends PrayerEvent {}

class SelectPrayerEvent extends PrayerEvent {
  final int index;

  const SelectPrayerEvent({required this.index});

  @override
  List<Object> get props => [index];
}
