import 'package:flutter/material.dart';
import 'package:ramadan_app/app/view/asma_al_husna/service/asma_al_husna_service.dart';
import 'package:ramadan_app/app/view/asma_al_husna/view/widgets/asma_al_husna_card.dart';
import 'package:ramadan_app/core/constants/app_endpoints.dart';

import 'package:ramadan_app/core/extensions/context_extension.dart';

class BodyWidget extends StatelessWidget {
  const BodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    AsmaAlHusnaService service =
        AsmaAlHusnaService(baseUrl: AppEndpoints.asmaulHusnaBaseUrl);
    return SingleChildScrollView(
      child: Padding(
        padding: context.horizontalPaddingMedium,
        child: Column(
          children: [
            Padding(
              padding: context.onlyBottomPaddingMedium,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(context.loc.asmaAlHusna,
                    style: context.textTheme.displayMedium),
              ),
            ),
            FutureBuilder(
              future: service.getAsmaAlHusna(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return GridView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data!.main!.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
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
                  );
                } else if (snapshot.hasError) {
                  return const Center(
                    child: Text("Error"),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
