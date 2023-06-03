import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/app/view/location/model/user_location_model.dart';
import 'package:ramadan_app/app/view/prayer_time/model/prayer_response_model.dart';
import 'package:ramadan_app/app/view/prayer_time/service/prayer_time_service.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';

part 'prayer_event.dart';
part 'prayer_state.dart';

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  final PrayerTimeService _service = PrayerTimeService(baseUrl: AppEndpoints.baseUrl);
  PrayerBloc() : super(const PrayerState(times: [], selectedPrayerIndex: 0, isLoading: true)) {
    on<PrayerFetchEvent>((event, emit) async {
      try {
        UserLocationModel user = LocationCubit().fetchUserLocation();
        PrayerResponseModel model = await _service.getTimesFromCoordinates(
          latitude: user.latitude.toString(),
          longitude: user.longitude.toString(),
        );
        List? times = model.times?.values.toList();
        emit(state.copyWith(times: times, isLoading: false));
      } catch (e) {
        debugPrint('PrayerFetchEvent: $e');
        throw Exception(e);
      }
    });

    on<PrayerSelectedEvent>(
      (event, emit) async {
        emit(state.copyWith(isLoading: true));
        await Future.delayed(const Duration(milliseconds: 500));
        emit(state.copyWith(selectedPrayerIndex: event.index, isLoading: false));
      },
    );
  }
}
