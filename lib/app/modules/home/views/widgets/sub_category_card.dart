import 'package:flutter/material.dart';
import '../../../../Core/Utils/colors.dart';

class SubCategoriesSection extends StatelessWidget {
  final String categoryName;
  final VoidCallback onBack;

  final Map<String, List<Map<String, dynamic>>> subCategories = {
    "الأثاث": [
      {
        "nameArabic": "عرض جميع الإعلانات",
        "isSpecial": true,
      },
      {
        "nameArabic": "كراسي فاخرة",
        "image": "assets/images/sub_categ_1.jpg",
      },
      {
        "nameArabic": "طاولات",
        "image": "assets/images/sub_categ_2.jpg",
      },
      {
        "nameArabic": "أسِرّة",
        "image": "assets/images/sub_categ_3.jpg",
      },
    ],
    "قطع سيارات": [
      {
        "nameArabic": "عرض جميع الإعلانات",
        "isSpecial": true,
      },
      {
        "nameArabic": "الإطارات",
        "image": "assets/icons/sub_1.png",
      },
      {
        "nameArabic": "بطاريات",
        "image": "assets/icons/sub_1.png",
      },
      {
        "nameArabic": "زيوت ومحروقات",
        "image": "assets/icons/sub_1.png",
      },
    ],
    "صيدلية": [
      {
        "nameArabic": "عرض جميع الإعلانات",
        "isSpecial": true,
      },
      {
        "nameArabic": "مستحضرات طبية",
        "image": "assets/icons/sub_2.png",
      },
      {
        "nameArabic": "أدوية عامة",
        "image": "assets/icons/sub_1.png",
      },
      {
        "nameArabic": "معدات طبية",
        "image": "assets/icons/sub_3.png",
      },
    ],
  };

   SubCategoriesSection({
    super.key,
    required this.categoryName,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    final items = subCategories[categoryName] ?? [];
    final double cardWidth = MediaQuery.of(context).size.width / 2 - 24;
    final double cardHeight = MediaQuery.of(context).size.height;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // 🔙 Header
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_circle_right_rounded, size: 32),
                  onPressed: onBack,
                ),
                Text(
                  categoryName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),

            // 🧩 Subcategory Cards
            if (items.isEmpty)
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(24.0),
                  child: Text(
                    "لا توجد فئات فرعية لهذه الفئة حالياً",
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ),
              )
            else
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: items.map((sub) {
                  final bool isSpecial = sub["isSpecial"] == true;

                  return SizedBox(
                    width: cardWidth,
                    height: cardHeight * 0.16,
                    child: Card(
                      elevation: isSpecial ? 6 : 3,
                      color: isSpecial ? AppColors.defaultbuttoncolor : null,
                      shadowColor: isSpecial
                          ? Colors.blueAccent.withOpacity(0.4)
                          : Colors.black12,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      clipBehavior: Clip.antiAlias,
                      child: Stack(
                        children: [
                          // 🖼️ Background for normal items
                          if (!isSpecial)
                            Image.asset(
                              sub["image"],
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),

                          // 🖤 Gradient overlay
                          if (!isSpecial)
                            Positioned.fill(
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.black.withOpacity(0.15),
                                      Colors.black.withOpacity(0.25),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                          // 🏷️ Title
                          if (!isSpecial)
                            Positioned(
                              top: 8,
                              right: 8,
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.black54,
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Text(
                                  sub["nameArabic"],
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),

                          // 🌟 Special “عرض جميع الإعلانات” Card
                          if (isSpecial)
                            Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.shop_rounded,
                                    color: Colors.white,
                                    size: 60,
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    "عرض جميع الإعلانات",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
