import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ramadan_app/app/view/bottom_navbar/bloc/bottom_navbar_bloc.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class NavbarWidget extends StatelessWidget {
  const NavbarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) => context.read<BottomNavbarBloc>().add(BottomNavbarEventChange(index: index)),
      currentIndex: context.watch<BottomNavbarBloc>().state.currentPage,
      fixedColor: AppColors.primaryColor,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'Prayer Calendar',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'Settings',
        ),
      ],
    );
  }
}
