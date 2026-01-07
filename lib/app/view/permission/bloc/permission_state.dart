part of 'permission_bloc.dart';

enum PermissionStatus { initial, loading, nextPage, completed, error }

class PermissionState extends Equatable {
  final PermissionStatus status;
  final bool isLocationGranted;
  final bool isNotificationGranted;

  const PermissionState({
    this.status = PermissionStatus.initial,
    this.isLocationGranted = false,
    this.isNotificationGranted = false,
  });

  PermissionState copyWith({
    PermissionStatus? status,
    bool? isLocationGranted,
    bool? isNotificationGranted,
  }) {
    return PermissionState(
      status: status ?? this.status,
      isLocationGranted: isLocationGranted ?? this.isLocationGranted,
      isNotificationGranted:
          isNotificationGranted ?? this.isNotificationGranted,
    );
  }

  @override
  List<Object> get props => [status, isLocationGranted, isNotificationGranted];
}
