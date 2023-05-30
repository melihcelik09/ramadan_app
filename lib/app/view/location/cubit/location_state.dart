part of 'location_cubit.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object?> get props => [];
}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {}

class LocationSelectedState extends LocationState {
  final String? selectedCountry;
  final String? selectedState;
  final String? selectedCity;

  const LocationSelectedState({
    this.selectedCountry,
    this.selectedState,
    this.selectedCity,
  });

  @override
  List<Object?> get props => [selectedCountry, selectedState, selectedCity];
}

class LocationError extends LocationState {
  final String message;

  const LocationError(this.message);

  @override
  List<Object> get props => [message];
}
