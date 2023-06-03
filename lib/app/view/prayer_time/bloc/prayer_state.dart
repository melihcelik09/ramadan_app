part of 'prayer_bloc.dart';

class PrayerState extends Equatable {
  final List times;
  final int selectedPrayerIndex;
  final bool? isLoading;
  const PrayerState({
    this.isLoading,
    required this.times,
    required this.selectedPrayerIndex,
  });

  PrayerState copyWith({
    List? times,
    int? selectedPrayerIndex,
    bool? isLoading,
  }) {
    return PrayerState(
      isLoading: isLoading ?? this.isLoading,
      times: times ?? this.times,
      selectedPrayerIndex: selectedPrayerIndex ?? this.selectedPrayerIndex,
    );
  }

  @override
  List<Object?> get props => [isLoading, times, selectedPrayerIndex];
}
