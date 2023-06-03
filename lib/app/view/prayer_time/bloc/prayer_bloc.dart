import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ramadan_app/app/view/location/cubit/location_cubit.dart';
import 'package:ramadan_app/app/view/location/model/user_location_model.dart';
import 'package:ramadan_app/app/view/prayer_time/model/prayer_response_model.dart';
import 'package:ramadan_app/app/view/prayer_time/service/prayer_time_service.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';

part 'prayer_event.dart';
part 'prayer_state.dart';

class PrayerBloc extends Bloc<PrayerEvent, PrayerState> {
  final PrayerTimeService _service = PrayerTimeService(baseUrl: AppEndpoints.baseUrl);
  PrayerResponseModel? _model;
  PrayerBloc() : super(PrayerLoading()) {
    on<LoadPrayerEvent>(
      (event, emit) async {
        emit(PrayerLoading());
        try {
          UserLocationModel user = LocationCubit().fetchUserLocation();
          _model = await _service.getTimesFromCoordinates(
            latitude: user.latitude.toString(),
            longitude: user.longitude.toString(),
          );
          List times = _model?.times?.values.toList() ?? [];
          emit(PrayerLoaded(prayers: times, selectedPrayerIndex: 0));
        } catch (e) {
          emit(PrayerError(message: e.toString()));
        }
      },
    );

    on<SelectPrayerEvent>(
      (event, emit) async {
        emit(PrayerLoading());
        await Future.delayed(const Duration(seconds: 1));
        List times = _model?.times?.values.toList() ?? [];
        emit(PrayerLoaded(prayers: times, selectedPrayerIndex: event.index));
      },
    );
  }
}
