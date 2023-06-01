part of 'prayer_bloc.dart';

abstract class PrayerState extends Equatable {
  const PrayerState();
  
  @override
  List<Object> get props => [];
}

class PrayerInitial extends PrayerState {}
