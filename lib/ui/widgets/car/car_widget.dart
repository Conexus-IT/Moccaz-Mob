import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/core/utils/format_currency.dart';
import 'package:mocaz/data/models/car.dart';
import 'package:mocaz/routes/navigation_service.dart';
import 'package:mocaz/ui/widgets/car/car_dettails.dart';

class CarCard extends StatelessWidget {
  final Car car;

  CarCard({Key? key, required this.car}) : super(key: key);
  AppColors appColors = AppColors();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap:
          () => NavigationService.navigateWithAnimation(
            CarDetailScreen(car: car),
          ),
      child: Container(
        width: size.width / 1.65,

        padding: const EdgeInsets.symmetric(horizontal: 4),

        child: Card(
          color: appColors.white,
          elevation: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Car image
              SizedBox(
                height: size.height * 0.18,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: CachedNetworkImage(
                        imageUrl: car.images.first,
                        imageBuilder:
                            (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8),
                                  topRight: Radius.circular(8),
                                ),
                                image: DecorationImage(
                                  image: imageProvider,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                        placeholder:
                            (context, url) =>
                                Center(child: CircularProgressIndicator()),
                        errorWidget: (context, url, error) => Icon(Icons.error),
                      ),
                    ),
                    Positioned(
                      top: 10,
                      left: 10,
                      child:
                          car.isBonDeal
                              ? SvgPicture.asset(
                                'assets/icons/deal.svg',

                                height: 24,
                              )
                              : Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: appColors.white,
                                  borderRadius: BorderRadius.circular(4),
                                ),
                                child: SvgPicture.asset(
                                  'assets/icons/mcheck.svg',

                                  height: 15,
                                ),
                              ),
                    ),
                    Positioned(
                      height: size.height * 0.075,
                      width: size.height * 0.075,
                      top: 1,
                      right: 1,
                      child: Card(
                        color: appColors.purple,
                        child: IconButton(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/icons/favorite.svg',
                            height: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Text(
                      car.title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        fontFamily: 'Poppins',
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),

                    // Subtitle
                    // Text(
                    //   car.subtitle,
                    //   style: TextStyle(
                    //     fontSize: 12,
                    //     fontWeight: FontWeight.w500,

                    //     fontFamily: 'Poppins',
                    //   ),
                    //   maxLines: 1,
                    //   overflow: TextOverflow.ellipsis,
                    // ),
                    // const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.calendar_today,
                                    size: 14,
                                    color: appColors.primaryCyan,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Text('${car.year}', style: carAttributeStyle),
                                ],
                              ),
                              SizedBox(height: size.height * 0.011),
                              Row(
                                children: [
                                  Icon(
                                    Icons.speed,
                                    size: 14,
                                    color: appColors.primaryCyan,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Text(
                                    '${car.mileage} km',
                                    style: carAttributeStyle,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              SizedBox(height: size.height * 0.011),
                              Row(
                                children: [
                                  Icon(
                                    Icons.local_gas_station,
                                    size: 14,
                                    color: appColors.primaryCyan,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Text(car.fuelType, style: carAttributeStyle),
                                ],
                              ),
                            ],
                          ),
                        ),

                        Expanded(
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.flash_on,
                                    size: 14,
                                    color: appColors.primaryCyan,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    '${car.power} cv',
                                    style: carAttributeStyle,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  Icon(
                                    Icons.sync_alt,
                                    size: 14,
                                    color: appColors.primaryCyan,
                                  ),
                                  SizedBox(width: size.width * 0.01),
                                  Text(
                                    car.transmission,
                                    style: carAttributeStyle,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Row(
                                children: [
                                  SvgPicture.asset('assets/icons/mcheck.svg'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: size.height * 0.02),

                    // Price
                    Text(
                      '${formatCurrency(car.price)} Dhs',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: appColors.purple,
                        letterSpacing: 0.8,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle carAttributeStyle = TextStyle(
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w400,
  );
}
