part of 'prayer_bloc.dart';

abstract class PrayerState extends Equatable {
  const PrayerState();

  @override
  List<Object> get props => [];
}

class PrayerLoading extends PrayerState {}

class PrayerLoaded extends PrayerState {
  final List prayers;
  final int selectedPrayerIndex;

  const PrayerLoaded({required this.prayers, required this.selectedPrayerIndex});

  @override
  List<Object> get props => [prayers, selectedPrayerIndex];
}

class PrayerError extends PrayerState {
  final String message;

  const PrayerError({required this.message});

  @override
  List<Object> get props => [message];
}
