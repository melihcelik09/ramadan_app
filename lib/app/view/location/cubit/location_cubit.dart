import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ramadan_app/app/view/location/model/location_model.dart';
import 'package:ramadan_app/app/view/location/model/user_location_model.dart';
import 'package:ramadan_app/app/view/location/service/location_service.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';
import 'package:ramadan_app/core/init/cache/cache_manager.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationService _service = LocationService(baseUrl: AppEndpoints.baseUrl);
  LocationCubit() : super(LocationInitial());

  List<LocationModel> countryList = [];
  List<String> stateList = [];
  List<String> cityList = [];
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  UserLocationModel? userLocation;

  Future<void> fetchCountries() async {
    try {
      countryList = await _service.fetchCountries();
      emit(LocationLoaded());
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  Future<void> fetchStates({required String country}) async {
    try {
      stateList = await _service.fetchStates(country: country);
      selectedState = null;
      selectedCity = null;
      cityList = [];
      emit(LocationLoaded());
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  Future<void> fetchCities({required String country, required String state}) async {
    try {
      cityList = await _service.fetchCities(country: country, state: state);
      selectedCity = null;
      emit(LocationLoaded());
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }

  void selectCountry({required String country}) {
    selectedCountry = country;
    emit(LocationSelectedState(
      selectedCountry: selectedCountry,
      selectedCity: null,
      selectedState: null,
    ));
  }

  void selectState({required String state}) {
    selectedState = state;
    emit(LocationSelectedState(
      selectedCountry: selectedCountry,
      selectedState: selectedState,
      selectedCity: null,
    ));
  }

  void selectCity({required String city}) {
    selectedCity = city;
    emit(LocationSelectedState(
      selectedCountry: selectedCountry,
      selectedState: selectedState,
      selectedCity: selectedCity,
    ));
  }

  Future<void> submitLocation() async {
    userLocation = UserLocationModel(country: selectedCountry, state: selectedState, city: selectedCity);
    await CacheManager<UserLocationModel?>().writeData(key: 'location', value: userLocation);
  }
}
