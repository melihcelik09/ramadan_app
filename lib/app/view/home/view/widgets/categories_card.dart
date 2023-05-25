import 'package:flutter/material.dart';
import 'package:ramadan_app/core/constants/app_colors.dart';

class CategoriesCard extends StatelessWidget {
  const CategoriesCard({
    super.key,
    required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    List<String> titles = [
      "Prayer Time",
      "Daily Hadith",
      "Qiable Finder",
      "Ramadan Time",
      "Asma Al-Husna"
    ];
    List<String> imageUrls = [
      "assets/images/categories/Praying.png",
      "assets/images/categories/Read.png",
      "assets/images/categories/Qibla.png",
      "assets/images/categories/Lamp.png",
      "assets/images/categories/Allah.png",
    ];
    return InkWell(
      onTap: () {
        switch (index) {
          case 0:
            print("Prayer Time");
            break;
          case 1:
            print("Daily Hadith");
            break;
          case 2:
            print("Qiable Finder");
            break;
          case 3:
            print("Ramadan Time");
            break;
          default:
            print("Asma Al-Husna");
        }
      },
      child: Card(
          color: AppColors.cardColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  imageUrls[index],
                  fit: BoxFit.fill,
                ),
                Text(titles[index]),
              ],
            ),
          )),
    );
  }
}
