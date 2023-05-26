part of 'location_bloc.dart';

abstract class LocationEvent extends Equatable {
  const LocationEvent();

  @override
  List<Object?> get props => [];
}

class InitialLocationEvent extends LocationEvent {}

class CountrySelectedEvent extends LocationEvent {
  final String country;

  const CountrySelectedEvent({required this.country});
}

class StateSelectedEvent extends LocationEvent {
  final String state;

  const StateSelectedEvent({required this.state});
}

class CitySelectedEvent extends LocationEvent {
  final String city;

  const CitySelectedEvent({required this.city});
}

class SubmitLocationEvent extends LocationEvent {}
