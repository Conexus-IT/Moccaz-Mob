import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/core/utils/format_currency.dart';
import 'package:mocaz/data/models/car.dart';
import 'package:mocaz/providers/car/car_provider.dart';
import 'package:mocaz/routes/navigation_service.dart';
import 'package:mocaz/ui/widgets/car/contact_seller_acreen.dart';
import 'package:mocaz/ui/widgets/car/features_widget.dart';
import 'package:provider/provider.dart';

class CarDetailScreen extends StatefulWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((counter) {
      CarProvider carProvider = Provider.of<CarProvider>(
        context,
        listen: false,
      );
      carProvider.renisilizeSlectedImageCounter();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CarProvider carProvider = Provider.of<CarProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          widget.car.title,
          style: TextStyle(fontFamily: 'Poppins', fontSize: 19),
        ),

        actions: [
          IconButton(icon: Icon(Icons.favorite_border), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Image Carousel (static image for now)
            Stack(
              children: [
                CarouselSlider(
                  carouselController: carProvider.carouselSliderController,
                  options: CarouselOptions(
                    height: 200,

                    viewportFraction: 1.0,
                    enableInfiniteScroll: false,
                    enlargeCenterPage: false,
                    autoPlay: false,
                    onPageChanged:
                        (index, reason) => carProvider.onImageChanged(index),
                  ),
                  items:
                      widget.car.images.map((url) {
                        return Builder(
                          builder: (BuildContext context) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: CachedNetworkImage(
                                imageUrl: url,

                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            );
                          },
                        );
                      }).toList(),
                ),

                Positioned(
                  top: 8,
                  left: 8,

                  child: SvgPicture.asset('assets/icons/deal.svg', height: 25),
                ),
                Positioned(
                  bottom: 8,
                  left: 8,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black54,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "${carProvider.slectedImageCounter} / ${widget.car.images.length}",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 80,

                  child: GestureDetector(
                    onTap: () => carProvider.previousImage(),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 11,
                        top: 6,
                        bottom: 6,
                        right: 3,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: AppColors().white,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  right: 10,
                  top: 80,

                  child: GestureDetector(
                    onTap:
                        () => carProvider.nextImage(widget.car.images.length),
                    child: Container(
                      padding: EdgeInsets.only(
                        left: 7,
                        top: 6,
                        bottom: 6,
                        right: 7,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.black54,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: AppColors().white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Title & Price
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.car.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  widget.car.subtitle,
                  style: TextStyle(color: Colors.grey[700]),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${formatCurrency(widget.car.price)} DHS",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF24005E),
                      ),
                    ),
                    const Spacer(),
                    SvgPicture.asset('assets/icons/mcheck.svg', height: 20),
                  ],
                ),
              ],
            ),

            // Location
            const SizedBox(height: 8),
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/map.png'),
                  fit: BoxFit.cover,
                ),
              ),
              height: 50,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.location_on, color: AppColors().primaryCyan),
                  SizedBox(width: 8),
                  Text(
                    widget.car.location,
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: AppColors().purple,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Characteristics Box
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(Icons.info_outline, color: Colors.deepPurple),
                      SizedBox(width: 8),
                      Text(
                        "CARACTÉRISTIQUES",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: 6),
                  Divider(),

                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _buildSpec(
                        "Année",
                        widget.car.year.toString(),
                        Icons.calendar_today_outlined,
                      ),
                      _buildSpec(
                        "Puissance fiscal",
                        widget.car.power.toString(),
                        Icons.speed,
                      ),
                      _buildSpec(
                        "Énergie",
                        widget.car.fuelType,
                        Icons.local_gas_station,
                      ),
                      _buildSpec(
                        "Boîte de vitesse",
                        widget.car.transmission,
                        Icons.settings,
                      ),
                      _buildSpec(
                        "Kilométrage",
                        widget.car.mileage.toString(),
                        Icons.speed_outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Download Button
            SizedBox(
              width: double.infinity,
              height: 53,
              child: MaterialButton(
                onPressed: () {},
                color: AppColors().purple,
                elevation: 7,

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "TÉLÉCHARGER LE RAPPORT TECHNIQUE",
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                    color: AppColors().white,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // Equipments
            FeaturesWidget(carOptions: widget.car.carOptions),
          ],
        ),
      ),

      bottomSheet: Container(
        color: AppColors().white,
        padding: EdgeInsets.all(20),
        child: MaterialButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          height: 55,
          color: AppColors().purple,
          textColor: AppColors().white,
          minWidth: double.infinity,
          onPressed:
              () => NavigationService.navigateWithAnimation(
                ContactSellerAcreen(),
              ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/icons/vendeur.svg'),
              SizedBox(width: 10),
              Text(
                'Contacter un Vendeur',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  color: AppColors().white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSpec(String label, String value, IconData icon) {
    return Row(
      children: [
        Icon(icon, size: 18, color: AppColors().primaryCyan),
        const SizedBox(width: 4),

        Text(label, style: TextStyle(color: Colors.grey[600], fontSize: 12)),
        Spacer(),
        Text(value, style: TextStyle(fontWeight: FontWeight.w700)),
      ],
    );
  }
}
