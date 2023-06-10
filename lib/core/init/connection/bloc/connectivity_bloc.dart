import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

// This class is a BLoC that listens for network changes.
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  // This field is a Connectivity object.
  final Connectivity _connectivity = Connectivity();

  // This field is a StreamSubscription object that listens for network changes.
  StreamSubscription<ConnectivityResult>? _subscription;

  // This constructor initializes the ConnectivityBloc object.
  ConnectivityBloc() : super(ConnectivityInitial()) {
    // This method listens for the ConnectivityConnected event.
    on<ConnectivityConnected>((event, emit) {
      // This method emits a ConnectivityConnectedState object.
      emit(ConnectivityConnectedState());
    });

    // This method listens for the ConnectivityDisconnected event.
    on<ConnectivityDisconnected>((event, emit) {
      // This method emits a ConnectivityDisconnectedState object with a message.
      emit(
        const ConnectivityDisconnectedState(
          message: "No Internet Connection. Please check your internet connection and try again.",
        ),
      );
    });

    // This method listens for the ConnectivityCheck event.
    on<ConnectivityCheck>(
      (event, emit) {
        // This method emits a ConnectivityInitialState object.
        emit(ConnectivityInitial());
        _checkConnectivity();
      },
    );
  }

  // This method checks the device's network connectivity.
  void _checkConnectivity() {
    // This method creates a StreamSubscription object.
    _subscription = _connectivity.onConnectivityChanged.listen((event) {
      // This if statement checks if the device is connected to the internet.
      if (event == ConnectivityResult.mobile || event == ConnectivityResult.wifi) {
        // This method prints a message to the console.
        debugPrint("Internet Connection $event");

        // This method emits a ConnectivityConnectedState object.
        add(ConnectivityConnected());
      } else {
        // This method prints a message to the console.
        debugPrint("No Internet Connection $event");

        // This method emits a ConnectivityDisconnectedState object.
        add(ConnectivityDisconnected());
      }
    });
  }

  // This method closes the StreamSubscription object.
  @override
  Future<void> close() async {
    // This method calls the cancel() method on the StreamSubscription object.
    await _subscription?.cancel();
    return super.close();
  }
}
