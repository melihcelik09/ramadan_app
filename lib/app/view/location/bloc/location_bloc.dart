import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/location/model/location_model.dart';
import 'package:ramadan_app/app/view/location/service/location_service.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';

part 'location_event.dart';
part 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  final LocationService _service = LocationService(baseUrl: AppEndpoints.baseUrl);

  LocationBloc() : super(const LocationState()) {
    on<InitialLocationEvent>((event, emit) async {
      try {
        List<LocationModel> countryList = await _service.fetchCountries();

        emit(state.copyWith(countryList: countryList));
      } catch (e) {
        emit(LocationError(e.toString()));
      }
    });
    on<CountrySelectedEvent>((event, emit) async {
      try {
        emit(state.copyWith(stateList: [], cityList: [], selectedState: '', selectedCity: ''));
        List<String> stateList = await _service.fetchStates(country: event.country);
        emit(state.copyWith(stateList: stateList, selectedCountry: event.country));
      } catch (e) {
        emit(LocationError(e.toString()));
      }
    });
    on<StateSelectedEvent>((event, emit) async {
      try {
        emit(state.copyWith(cityList: [], selectedState: ''));
        List<String> cityList = await _service.fetchCities(country: state.selectedCountry, state: event.state);
        emit(state.copyWith(cityList: cityList, selectedState: event.state));
      } catch (e) {
        emit(LocationError(e.toString()));
      }
    });
    on<CitySelectedEvent>((event, emit) async {
      emit(state.copyWith(selectedCity: event.city));
    });

    on<SubmitLocationEvent>((event, emit) async {
      debugPrint("Country: ${state.selectedCountry}");
      debugPrint("State: ${state.selectedState}");
      debugPrint("City: ${state.selectedCity}");
    });
  }
}
