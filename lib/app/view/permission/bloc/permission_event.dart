part of 'permission_bloc.dart';

abstract class PermissionEvent extends Equatable {
  const PermissionEvent();

  @override
  List<Object> get props => [];
}

class RequestLocationPermission extends PermissionEvent {}

class RequestNotificationPermission extends PermissionEvent {}

class SkipPermission extends PermissionEvent {}
