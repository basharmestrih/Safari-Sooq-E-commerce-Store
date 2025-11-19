import 'package:flutter/material.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AnimatedBarExample extends StatefulWidget {
  const AnimatedBarExample({super.key});

  @override
  State<AnimatedBarExample> createState() => _AnimatedBarExampleState();
}

class _AnimatedBarExampleState extends State<AnimatedBarExample> {
  int selected = 0;
  final controller = PageController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      final height = MediaQuery.of(context).size.height;

    return 
   SizedBox(
    height: height * 0.07,
     child: StylishBottomBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          hasNotch: true,
          fabLocation: StylishBarFabLocation.center,
          notchStyle: NotchStyle.circle,
          currentIndex: selected,
     
          // 🔹 Using Default style (no moving indicator)
          option: AnimatedBarOptions(
            iconStyle: IconStyle.Default,
            barAnimation: BarAnimation.fade,
            opacity: 0.2,
          ),
     
          items: [
            BottomBarItem(
              icon: const Icon(Icons.home_outlined, size: 30),
              selectedIcon: const Icon(Icons.home, size: 40),
              selectedColor: Colors.blue,
              unSelectedColor:Colors.grey,
              title: const Text(
                'الرئيسية',
                style: TextStyle(fontSize: 14),
              ),
            ),
            
            BottomBarItem(
              icon: const Icon(Icons.store_outlined, size: 40),
              selectedIcon: const Icon(Icons.store, size: 44),
              selectedColor: Colors.blue,
              unSelectedColor:  Colors.grey,
              title: const Text(
                'المتجر',
                style: TextStyle(fontSize: 13),
              ),
            ),
            BottomBarItem(
              icon: const Icon(Icons.delivery_dining, size: 40),
              selectedIcon: const Icon(Icons.delivery_dining, size: 44),
              selectedColor: Colors.blue,
              unSelectedColor:Colors.grey,
              title: const Text(
                'التوصيل',
                style: TextStyle(fontSize: 14),
              ),
            ),
            BottomBarItem(
              icon: const Icon(Icons.person_outline, size: 40),
              selectedIcon: const Icon(Icons.person, size: 44),
              selectedColor: Colors.blue,
              unSelectedColor: Colors.grey,
              title: const Text(
                'حسابي',
                style: TextStyle(fontSize: 14),
              ),
            ),
          ],
          onTap: (index) {
            setState(() {
              selected = index;
            });
            controller.jumpToPage(index);
          },
        ),
   );
      
  }
}
