import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/core/init/connection/bloc/connectivity_bloc.dart';

class ErrorView extends StatelessWidget {
  final String message;
  const ErrorView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ConnectivityBloc, ConnectivityState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(message),
                ElevatedButton(
                  onPressed: () {
                    context.read<ConnectivityBloc>().add(ConnectivityCheck());
                  },
                  child: const Text("Retry"),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
