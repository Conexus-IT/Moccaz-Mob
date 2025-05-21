import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/core/utils/decoration.dart';
import 'package:mocaz/data/models/car.dart';
import 'package:mocaz/data/models/demo_car_list.dart';
import 'package:mocaz/providers/car/buy_vehicle_provider.dart';
import 'package:mocaz/providers/car/car_provider.dart';
import 'package:mocaz/ui/widgets/car/car_widget.dart';
import 'package:mocaz/ui/widgets/car/fillterModalBottomSheet.dart';
import 'package:mocaz/ui/widgets/car/filltred_carCard_widget.dart';
import 'package:mocaz/ui/widgets/search/search_widget.dart';
import 'package:provider/provider.dart';

class SaleScreen extends StatefulWidget {
  const SaleScreen({super.key});

  @override
  State<SaleScreen> createState() => _SaleScreenState();
}

class _SaleScreenState extends State<SaleScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    CarProvider carProvider = context.read<CarProvider>();
    Size size = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => BuyVehicleProvider(),

      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: Column(
            children: [
              _searchWidget(),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // sort by row
                  _sortByWidget(),
                  SizedBox(width: 20),
                  // bon deal & m-check row
                  _dropDownMenuWidget(),
                  SizedBox(height: 6),
                ],
              ),
              SizedBox(height: 12),

              // filtred result
              Expanded(
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                  ),
                  itemCount: carList.length,
                  itemBuilder: (context, index) {
                    Car car = carList[index];
                    return FilltredCarCard(car: car, carProvider: carProvider);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _searchWidget() => Material(
    elevation: 1,
    shadowColor: const Color.fromARGB(255, 210, 210, 210),
    borderRadius: BorderRadius.circular(12),
    child: SizedBox(
      height: 55,
      child: TextFormField(
        decoration: InputDecoration(
          filled: true,
          fillColor: Color(0xffF6F6F6),

          border: OutlineInputBorder(
            borderSide: BorderSide.none,

            borderRadius: BorderRadius.circular(12),
          ),
          hintText: 'Recherche',
          hintStyle: TextStyle(fontFamily: 'Poppins'),
          prefixIcon: Icon(Icons.search),

          suffixIcon: Container(
            margin: EdgeInsets.symmetric(horizontal: 5),
            width: 50,
            height: 50,

            child: Card(
              color: AppColors().purple,
              child: IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    backgroundColor: AppColors().white,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => Filltermodalbottomsheet(),
                  );
                },
                icon: Icon(Icons.filter_list, color: AppColors().primaryCyan),
              ),
            ),
          ),
        ),
      ),
    ),
  );
  _sortByWidget() {
    return SizedBox(
      width: 150,
      height: 55,
      child: Material(
        elevation: 1,
        shadowColor: const Color.fromARGB(255, 210, 210, 210),
        borderRadius: BorderRadius.circular(12),
        color: Color(0xffF6F6F6),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Trié par :',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
              ),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              onPressed: () {},
              icon: Image.asset('assets/icons/sortby.png'),
            ),
          ],
        ),
      ),
    );
  }

  _dropDownMenuWidget() {
    return Expanded(
      child: Consumer<BuyVehicleProvider>(
        builder:
            (context, buyVehicleProvider, child) => SizedBox(
              width: 150,
              height: 55,

              child: Material(
                borderRadius: BorderRadius.circular(12),
                elevation: 1,
                child: DropdownButtonFormField(
                  dropdownColor: Color(0xffF6F6F6),
                  decoration: InputDecoration(
                    filled: true,

                    fillColor: Color(0xffF6F6F6),

                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),

                  value: buyVehicleProvider.selectedType,
                  items:
                      buyVehicleProvider.carTypes
                          .map(
                            (carType) => DropdownMenuItem(
                              value: carType,
                              child: Text(carType),
                            ),
                          )
                          .toList(),
                  onChanged: buyVehicleProvider.onChanged,
                ),
              ),
            ),
      ),
    );
  }
}
