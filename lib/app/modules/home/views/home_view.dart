import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../Widgets/main_appbar.dart';
import '../controllers/home_controller.dart';
import 'widgets/ads_banner.dart';
import '../../../Widgets/bottom_bar.dart';
import 'widgets/categories_card.dart';
import 'widgets/filters_chips.dart';
import 'widgets/pray_time_reminder.dart';
import 'widgets/sub_category_card.dart'; 

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeController controller = Get.put(HomeController());

@override
void initState() {
  super.initState();
  controller.loadCategories();
}

  
  String? selectedCategory;

  void onCategoryTap(String categoryName) {
    setState(() {
      selectedCategory = categoryName;
    });
  }

  void onBack() {
    setState(() {
      selectedCategory = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 60,
        height: 60,
        child: FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Colors.blue,
          onPressed: () {
            
          },
          child: const Icon(
            LucideIcons.plus,
            color: Colors.white,
            size: 32,
          ),
        ),
      ),
      backgroundColor: theme.colorScheme.background,
      appBar: MainAppBar(),
      bottomNavigationBar: AnimatedBarExample(),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FilterChipsSection(),
              const SizedBox(height: 12),
              const AdsBannerSection(),
              const SizedBox(height: 12),
              const PrayerTimeSection(),
              const SizedBox(height: 12),

             AnimatedSwitcher(
  duration: const Duration(milliseconds: 400),
  transitionBuilder: (Widget child, Animation<double> animation) {
    final offsetAnimation = Tween<Offset>(
      begin: const Offset(0.1, 0),
      end: Offset.zero,
    ).animate(animation);
    return FadeTransition(
      opacity: animation,
      child: SlideTransition(
        position: offsetAnimation,
        child: child,
      ),
    );
  },
  child: selectedCategory == null
      ? GetBuilder<HomeController>(
      builder: (controller) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.error != null) {
          return Center(child: Text('Error: ${controller.error}'));
        }

        return CategoriesSection(
          key: const ValueKey('main'),
          categories: controller.categories, 
          onTapCategory: onCategoryTap,
        );
      },
    )

      : SubCategoriesSection(
          key: const ValueKey('sub'),
          categoryName: selectedCategory!,
          onBack: onBack,
        ),
),

            ],
          ),
        ),
      ),
    );
  }
}
