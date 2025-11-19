import 'package:flutter/material.dart';

class AdsBannerSection extends StatelessWidget {
  const AdsBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController pageController = PageController(viewportFraction: 0.92);

    const bannerGradient = LinearGradient(
      colors: [
       
        Color(0xFF29D8A6),
         Color(0xFF034BF2),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

    const buttonGradient = LinearGradient(
      colors: [
       
        Color(0xFF034BF2),
         Color(0xFF29D8A6),
      ],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
    );

final List<Map<String, String>> ads = [
  {
    "title": "تخفيضات الإلكترونيات الكبرى",
    "discount": "خصم يصل إلى ٥٠٪",
    "desc": "أحدث الأجهزة، الهواتف والمزيد بأسعار مذهلة",
    "button": "تسوق الآن"
  },
  {
    "title": "مهرجان الموضة 👗",
    "discount": "اشترِ ١ واحصل على الآخر مجانًا",
    "desc": "أزياء واكسسوارات عصرية تناسب كل الأذواق",
    "button": "اكتشف"
  },
  {
    "title": "تخفيضات البقالة 🛒",
    "discount": "وفر حتى ٤٠٪",
    "desc": "منتجات طازجة واحتياجات يومية بأسعار منخفضة",
    "button": "احصل الآن"
  },
];


    return SizedBox(
      height: 140,
      width: double.infinity,
      child: PageView.builder(
        controller: pageController,
        itemCount: ads.length,
        itemBuilder: (context, index) {
          final ad = ads[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Container(
                decoration: const BoxDecoration(
                  gradient: bannerGradient,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Stack(
                    children: [
                      // Ad texts
                      Positioned(
                        top: 8,
                        left: 8,
                        right: 8,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              ad["title"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              ad["discount"]!,
                              style: const TextStyle(
                                color: Colors.yellowAccent,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              ad["desc"]!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                fontWeight: FontWeight.w200
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Bottom-left button
                      Positioned(
                        bottom: 10,
                        left: 8,
                        child: Container(
                          decoration: const BoxDecoration(
                            gradient: buttonGradient,
                            borderRadius: BorderRadius.all(Radius.circular(24)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              )
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(24),
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 8),
                                child: Text(
                                  ad["button"]!,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
