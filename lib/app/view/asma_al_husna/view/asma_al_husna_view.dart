import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/widgets/index.dart';

@RoutePage()
class AsmaAlHusnaView extends StatelessWidget {
  const AsmaAlHusnaView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarWidget(),
      body: BodyWidget(),
    );
  }
}
