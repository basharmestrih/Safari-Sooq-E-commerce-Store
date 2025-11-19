import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class AdImagesCarousel extends StatefulWidget {
  final List<String> imageUrls;
  const AdImagesCarousel({super.key, required this.imageUrls});

  @override
  State<AdImagesCarousel> createState() => _AdImagesCarouselState();
}

class _AdImagesCarouselState extends State<AdImagesCarousel> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final horizontalPadding = screenWidth * 0.02; // 4% width
    final indicatorTopPadding = screenHeight * 0.01; // 1% height
    final indicatorSizeActive = screenWidth * 0.025; // active indicator size
    final indicatorSizeInactive = screenWidth * 0.015; // inactive indicator size

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(screenWidth * 0.03),
            child: CarouselSlider.builder(
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index, realIndex) {
                return Image.asset(
                  widget.imageUrls[index],
                  fit: BoxFit.cover,
                  width: double.infinity,
                );
              },
              options: CarouselOptions(
                aspectRatio: 16 / 9,
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                onPageChanged: (index, reason) {
                  setState(() => currentIndex = index);
                },
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: indicatorTopPadding),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(widget.imageUrls.length, (index) {
              bool isActive = currentIndex == index;
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: EdgeInsets.symmetric(horizontal: horizontalPadding * 0.4),
                width: isActive ? indicatorSizeActive : indicatorSizeInactive,
                height: isActive ? indicatorSizeActive : indicatorSizeInactive,
                decoration: BoxDecoration(
                  color: isActive ? Colors.black : Colors.grey.withOpacity(0.4),
                  shape: BoxShape.circle,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
