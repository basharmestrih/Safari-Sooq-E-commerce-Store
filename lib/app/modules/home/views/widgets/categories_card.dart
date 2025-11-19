import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Utils/colors.dart';
import '../../../../data/models/main_category.dart';
import '../../controllers/home_controller.dart';

class CategoriesSection extends StatefulWidget {
  final Function(String) onTapCategory;
  final List<Category> categories;

  const CategoriesSection({
    super.key,
    required this.onTapCategory,
    required this.categories,
  });

  @override
  State<CategoriesSection> createState() => _CategoriesSectionState();
}

class _CategoriesSectionState extends State<CategoriesSection> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    //  Responsive constants
    final double padding = size.width * 0.04; // ≈16
    final double spacing = size.width * 0.03; // ≈12
    final double borderRadius = size.width * 0.04; // ≈16
    final double badgeTop = size.height * 0.015; // ≈13
    final double badgeSide = size.width * 0.025; // ≈10
    final double badgeHPad = size.width * 0.025;
    final double badgeVPad = size.height * 0.005;
    final double textHPad = size.width * 0.02; // ≈8
    final double overlayOpacity = 0.35;
    final double elevation = 4;

    final double cardWidth = size.width / 2 - (padding + spacing);
    final double cardHeight = size.height * 0.22;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Wrap(
        spacing: spacing,
        runSpacing: spacing,
        children: widget.categories.map((cat) {
          return GestureDetector(
            onTap: () => widget.onTapCategory(cat.nameArabic),
            child: SizedBox(
              width: cardWidth,
              height: cardHeight,
              child: Card(
                elevation: elevation,
                color: Colors.white,
                shadowColor: Colors.black12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
                clipBehavior: Clip.antiAlias,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: Image.network(
                        cat.image,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(overlayOpacity),
                      ),
                    ),
                    Positioned(
                      top: badgeTop,
                      left: badgeSide,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: badgeHPad,
                          vertical: badgeVPad,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.white.withOpacity(0.97),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          cat.productsCount.toString(),
                          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.defaultbuttoncolor,
                              ),
                        ),
                      ),
                    ),
                    Center(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: textHPad),
                        child: Text(
                          cat.nameArabic,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: Colors.white,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
