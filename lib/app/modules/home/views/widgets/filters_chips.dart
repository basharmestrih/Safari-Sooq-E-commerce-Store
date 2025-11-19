import 'package:flutter/material.dart';
import '../../../../Core/Utils/colors.dart';

class FilterChipsSection extends StatefulWidget {
  const FilterChipsSection({super.key});

  @override
  State<FilterChipsSection> createState() => _FilterChipsSectionState();
}

class _FilterChipsSectionState extends State<FilterChipsSection> {
final List<String> chips = [
  "كل المنتجات",      // All Items
  "الأكثر شعبية",    // Popular
  "الأحدث",          // Newest
  "التخفيضات",       // Discounts
  "موصى به",         // Recommended
  "الأكثر طلبًا",    // Most Demand
  "عصري",            // Trendy
  "الأرخص"           // Cheapest
];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: SizedBox(
        height: 40,
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            final bool isSelected = selectedIndex == index;
      
            return GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                padding: const EdgeInsets.symmetric(horizontal: 14),
                decoration: BoxDecoration(
                  //gradient: isSelected ? AppColors.buttonGradient : null,
                  color: isSelected ? AppColors.defaultbuttoncolor : const Color.fromARGB(255, 237, 237, 237),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: isSelected
                      ? [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ]
                      : [],
                 
                ),
                alignment: Alignment.center,
                child: Text(
                  chips[index],
                  style: TextStyle(
                    color: isSelected ? AppColors.black : AppColors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemCount: chips.length,
        ),
      ),
    );
  }
}
