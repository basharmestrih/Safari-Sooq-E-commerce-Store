import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../../Widgets/main_appbar.dart';
import '../controllers/adDisplay_controller.dart';
import 'widgets/ad_auction_card.dart';
import 'widgets/ad_contact_bar.dart';
import 'widgets/ad_description_card.dart';
import 'widgets/ad_extras_card.dart';
import 'widgets/ad_images_carousel.dart';
import 'widgets/ad_info_card.dart';

class AddisplayView extends StatefulWidget {
  const AddisplayView({super.key});

  @override
  State<AddisplayView> createState() => _AddisplayViewState();
}

class _AddisplayViewState extends State<AddisplayView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    // Dummy example data (you’ll replace with controller data)
    final List<String> adImages = [
      'assets/images/adimaagetest.jpg',
      'assets/images/adimaagetest.jpg',
      'assets/images/adimaagetest.jpg',
    ];

     return Scaffold(
  extendBody: true,
  backgroundColor: theme.colorScheme.background,
  appBar: MainAppBar(),
    floatingActionButton: const ContactFABs(),
  floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
  body: Stack(
    children: [
      SingleChildScrollView(
        child: Column(
          children: [
            AdImagesCarousel(imageUrls: adImages),
            AdInfoCard(title: 'فيلا فاخرة في الرياض', price: 2500000.00),
            AdAuctionCard(),
            AdDescriptionCard(
            description:
                'فيلا فاخرة تقع في قلب مدينة الرياض بتصميم حديث، تحتوي على مسبح خاص وتقنيات المنزل الذكي. '
                'تحتوي على حديقة واسعة، غرفة ألعاب، صالة رياضية، وأنظمة أمان متكاملة. '
                'الموقع مميز بالقرب من الخدمات والمطاعم الفاخرة، مناسب للعائلات الباحثة عن الرفاهية والراحة.',
          ),

            AdExtrasCard(
              adTitle: 'بطاقة الإعلان',
              category: 'عقارات / فلل',
              createdBy: 'Nermin99',
              lastUpdated: '09-11-2025',
              location: 'السعودية, الرياض, العليا',
            ),
          ],
        ),
      ),
      // FABs overlay
    ],
  ),
);

  }
}
