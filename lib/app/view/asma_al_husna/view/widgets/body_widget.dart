import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/widgets/asma_al_husna_card.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

import 'package:ramadan_app/core/extensions/context_extension.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: PaddingExtensionSymetric(context).horizontalPaddingMedium,
        child: Column(
          children: [
            const Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Asma Al Husna",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.secondaryColor),
                )),
            GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 99,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return AsmaAlHusnaCard(
                  index: index,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}