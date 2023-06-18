part of 'permission_bloc.dart';

class PermissionState extends Equatable {
  final PageController controller;
  const PermissionState({required this.controller});

  @override
  List<Object> get props => [controller];
}
