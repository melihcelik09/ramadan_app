part of 'prayer_bloc.dart';

abstract class PrayerState extends Equatable {
  const PrayerState();

  @override
  List<Object> get props => [];
}

class PrayerInitial extends PrayerState {}

class PrayerLoading extends PrayerState {}

class PrayerLoaded extends PrayerState {
  final List times;
  final int selectedPrayerIndex;

  const PrayerLoaded({
    required this.times,
    required this.selectedPrayerIndex,
  });

  @override
  List<Object> get props => [times, selectedPrayerIndex];

  PrayerLoaded copyWith({
    List? times,
    int? selectedPrayerIndex,
  }) {
    return PrayerLoaded(
      times: times ?? this.times,
      selectedPrayerIndex: selectedPrayerIndex ?? this.selectedPrayerIndex,
    );
  }
}

class PrayerError extends PrayerState {
  final String message;

  const PrayerError({required this.message});

  @override
  List<Object> get props => [message];
}
