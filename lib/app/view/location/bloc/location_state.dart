part of 'location_bloc.dart';

class LocationState extends Equatable {
  final List<LocationModel> countryList;
  final List<String> stateList;
  final List<String> cityList;
  final String selectedCountry;
  final String selectedState;
  final String selectedCity;

  const LocationState({
    this.countryList = const [],
    this.stateList = const [],
    this.cityList = const [],
    this.selectedCountry = '',
    this.selectedState = '',
    this.selectedCity = '',
  });

  LocationState copyWith({
    List<LocationModel>? countryList,
    List<String>? stateList,
    List<String>? cityList,
    String? selectedCountry,
    String? selectedState,
    String? selectedCity,
  }) {
    return LocationState(
      countryList: countryList ?? this.countryList,
      stateList: stateList ?? this.stateList,
      cityList: cityList ?? this.cityList,
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedState: selectedState ?? this.selectedState,
      selectedCity: selectedCity ?? this.selectedCity,
    );
  }

  @override
  List<Object> get props => [countryList, stateList, cityList, selectedCountry, selectedState, selectedCity];
}

class LocationError extends LocationState {
  final String message;

  const LocationError(this.message);

  @override
  List<Object> get props => [message];
}
