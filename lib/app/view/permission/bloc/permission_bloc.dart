import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:permission_handler/permission_handler.dart';

part 'permission_event.dart';
part 'permission_state.dart';

class PermissionBloc extends Bloc<PermissionEvent, PermissionState> {
  PermissionBloc() : super(const PermissionState()) {
    on<RequestLocationPermission>(_onLocationRequested);
    on<RequestNotificationPermission>(_onNotificationRequested);
  }

  Future<void> _onLocationRequested(
    RequestLocationPermission event,
    Emitter<PermissionState> emit,
  ) async {
    emit(state.copyWith(status: PermissionStatus.loading));

    final isGranted = await _handlePermission(Permission.location);

    emit(
      state.copyWith(
        status: PermissionStatus.nextPage,
        isLocationGranted: isGranted,
      ),
    );

    emit(state.copyWith(status: PermissionStatus.initial));
  }

  Future<void> _onNotificationRequested(
    RequestNotificationPermission event,
    Emitter<PermissionState> emit,
  ) async {
    emit(state.copyWith(status: PermissionStatus.loading));

    final isGranted = await _handlePermission(Permission.notification);

    emit(
      state.copyWith(
        status: PermissionStatus.completed,
        isNotificationGranted: isGranted,
      ),
    );
  }

  Future<bool> _handlePermission(Permission permission) async {
    final status = await permission.status;

    if (status.isGranted) {
      return true;
    }

    if (status.isDenied || status.isLimited) {
      final result = await permission.request();
      return result.isGranted;
    }

    if (status.isPermanentlyDenied) {
      await openAppSettings();

      return false;
    }

    return false;
  }
}
