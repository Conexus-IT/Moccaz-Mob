class Car {
  final String title;
  final String subtitle;
  final int year;
  final int power;
  final int mileage;
  final String transmission;
  final String fuelType;
  final bool isMCheck;
  final double price;
  final bool isBonDeal;
  final List<String> images; // Changed to a List
  final List<String> carOptions;

  Car({
    required this.title,
    required this.subtitle,
    required this.carOptions,
    required this.year,
    required this.power,
    required this.mileage,
    required this.transmission,
    required this.fuelType,
    required this.isMCheck,
    required this.price,
    required this.isBonDeal,
    required this.images,
  });
}
