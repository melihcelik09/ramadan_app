import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import 'package:ramadan_app/app/view/bottom_navbar/view/widgets/navbar_widget.dart';

@RoutePage()
class BottomNavigationBarView extends StatelessWidget {
  const BottomNavigationBarView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const NavbarWidget(),
      body: BlocBuilder<BottomNavbarBloc, BottomNavbarInitial>(builder: (context, state) {
        return state.pages[state.currentPage];
      }),
    );
  }
}
