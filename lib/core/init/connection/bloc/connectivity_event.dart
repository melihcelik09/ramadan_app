part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object> get props => [];
}

// This class represents the event that is emitted when the device is connected to the internet.
class ConnectivityConnected extends ConnectivityEvent {}

// This class represents the event that is emitted when the device is disconnected from the internet.
class ConnectivityDisconnected extends ConnectivityEvent {}

// This class represents the event that is emitted when the device's network connectivity is checked.
class ConnectivityCheck extends ConnectivityEvent {}
