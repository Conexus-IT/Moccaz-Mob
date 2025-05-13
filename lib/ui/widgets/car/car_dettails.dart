import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/core/utils/format_currency.dart';
import 'package:mocaz/data/models/car.dart';
import 'package:mocaz/providers/car/car_provider.dart';
import 'package:mocaz/ui/widgets/car/features_widget.dart';
import 'package:provider/provider.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    CarProvider carProvider = Provider.of<CarProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(car.title),

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
                      car.images.map((url) {
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
                      "${carProvider.slectedImageCounter} / ${car.images.length}",
                      style: TextStyle(color: Colors.white),
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
                  car.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(car.subtitle, style: TextStyle(color: Colors.grey[700])),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      "${formatCurrency(car.price)} DHS",
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
            const SizedBox(height: 24),

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
                  const SizedBox(height: 16),
                  Wrap(
                    spacing: 16,
                    runSpacing: 12,
                    children: [
                      _buildSpec(
                        "Année",
                        car.year.toString(),
                        Icons.calendar_today_outlined,
                      ),
                      _buildSpec(
                        "Puissance fiscal",
                        car.power.toString(),
                        Icons.speed,
                      ),
                      _buildSpec(
                        "Énergie",
                        car.fuelType,
                        Icons.local_gas_station,
                      ),
                      _buildSpec(
                        "Boîte de vitesse",
                        car.transmission,
                        Icons.settings,
                      ),
                      _buildSpec(
                        "Kilométrage",
                        car.mileage.toString(),
                        Icons.speed_outlined,
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

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

            const SizedBox(height: 15),

            // Equipments
            FeaturesWidget(carOptions: car.carOptions),
          ],
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
