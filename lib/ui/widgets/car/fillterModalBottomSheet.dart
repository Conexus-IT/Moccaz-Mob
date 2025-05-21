import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/providers/car/sell_vehicle_provider.dart';
import 'package:mocaz/routes/navigation_service.dart';
import 'package:mocaz/ui/widgets/car/sell_vehicle_modal_step_tue.dart';
import 'package:provider/provider.dart';

class Filltermodalbottomsheet extends StatefulWidget {
  @override
  _SellVehicleModalState createState() => _SellVehicleModalState();
}

class _SellVehicleModalState extends State<Filltermodalbottomsheet> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CircleAvatar(backgroundColor: AppColors().white),
              Center(
                child: Text(
                  'Filtrer',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    fontFamily: 'Poppins',
                  ),
                ),
              ),

              CircleAvatar(
                backgroundColor: AppColors().purple,
                child: IconButton(
                  onPressed: () {
                    NavigationService.goBack();
                  },
                  icon: Icon(Icons.close, color: AppColors().white),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xffF6F6F6),

              border: OutlineInputBorder(
                borderSide: BorderSide.none,

                borderRadius: BorderRadius.circular(12),
              ),
              hintText: 'Recherche par mot clé',
              hintStyle: TextStyle(fontFamily: 'Poppins'),
              prefixIcon: Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 10),
          
        ],
      ),
    );
  }
}
