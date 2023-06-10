part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object> get props => [];
}

// This class represents the initial state of the connectivity bloc
class ConnectivityInitial extends ConnectivityState {}

// This class represents the state of the connectivity bloc when the device is connected to the internet.
class ConnectivityConnectedState extends ConnectivityState {}

// This class represents the state of the connectivity bloc when the device is disconnected from the internet.
class ConnectivityDisconnectedState extends ConnectivityState {
  // This field is the message that is displayed when the device is disconnected from the internet.
  final String message;
  const ConnectivityDisconnectedState({required this.message});
}
