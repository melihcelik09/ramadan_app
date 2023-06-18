part of 'permission_bloc.dart';

class PermissionEvent extends Equatable {
  final int index;
  final BuildContext context;
  const PermissionEvent(this.context, {required this.index});

  @override
  List<Object> get props => [context, index];
}
