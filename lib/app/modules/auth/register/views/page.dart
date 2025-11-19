import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../Core/Utils/colors.dart';
import '../controllers/register_controller.dart' show RegisterController;
import 'widgets/signup_form.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());
    final size = MediaQuery.of(context).size;
    final height = size.height;

    const expandedHeight = 250.0;
    const minHeight = kToolbarHeight;

    return Container(
       decoration: const BoxDecoration(
          gradient: AppColors.scaffoldGradient,),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              pinned: true,
              expandedHeight: expandedHeight,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () => Navigator.pop(context),
              ),
              flexibleSpace: LayoutBuilder(
                builder: (context, constraints) {
                  final shrinkOffset = expandedHeight - constraints.maxHeight;
                  final progress =
                      (shrinkOffset / (expandedHeight - minHeight)).clamp(0.0, 1.0);
      
                  // Determine if app bar is expanded
                 final bool isExpanded = progress > 0.5;

      
                  // Set color based on isExpanded
                  final backgroundColor =
                      isExpanded ? AppColors.defaultbuttoncolor :Colors.transparent;
      
                  // Logo scaling and position
                  final logoSize = 95 * (1 - 0.5 * progress);
                  final logoTop = 40 * (1.4 - progress);
                  final logoLeft =
                      size.width / 2 - logoSize / 2 + progress * (size.width / 2 - 1 - logoSize / 4);
      
                  // Title scaling and position
                  final titleSize = 28 * (1 - 0.2 * progress);
                  final titleTop = 160 * (1 - progress) + progress * (minHeight / 2 - titleSize / 2);
      
                  return Container(
                    color: backgroundColor,
                    child: Stack(
                      children: [
                        Positioned(
                          top: logoTop,
                          right: logoLeft,
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            size: logoSize,
                            color: Colors.white,
                          ),
                        ),
                        Positioned(
                          top: titleTop,
                          left: 0,
                          right: 0,
                          child: Center(
                            child: Text(
                              'new_account'.tr,
                              style: TextStyle(
                                fontSize: titleSize,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
                  child: const SignUpForm(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
