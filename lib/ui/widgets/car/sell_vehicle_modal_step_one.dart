import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/providers/car/sell_vehicle_provider.dart';
import 'package:mocaz/routes/navigation_service.dart';
import 'package:mocaz/ui/widgets/car/sell_vehicle_modal_step_tue.dart';
import 'package:provider/provider.dart';

class SellVehicleModalStepOne extends StatefulWidget {
  @override
  _SellVehicleModalState createState() => _SellVehicleModalState();
}

class _SellVehicleModalState extends State<SellVehicleModalStepOne> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SellVehicleProvider(),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets + const EdgeInsets.all(16.0),
        child: Consumer<SellVehicleProvider>(
          builder:
              (
                context,
                SellVehicleProvider sellVehicleProvider,
                child,
              ) => Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CircleAvatar(backgroundColor: AppColors().white),
                      Center(
                        child: Text(
                          'Vendre mon véhicule',
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
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Vous souhaitez?',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  ...List.generate(sellVehicleProvider.options.length, (index) {
                    final isSelected =
                        sellVehicleProvider.selectedIndex == index;
                    return GestureDetector(
                      onTap: () {
                        sellVehicleProvider.onOptionChnaged(index);
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 6),
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                          horizontal: 12,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? Colors.white : Colors.grey[100],
                          border: Border.all(
                            color:
                                isSelected
                                    ? AppColors().primaryCyan
                                    : Colors.grey[400]!,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Text(
                                sellVehicleProvider.options[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color:
                                      isSelected
                                          ? AppColors().purple
                                          : Colors.black87,
                                ),
                              ),
                            ),
                            if (isSelected)
                              Icon(
                                Icons.check_circle,
                                color: AppColors().primaryCyan,
                                size: 22,
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      backgroundColor: AppColors().purple,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                        context: context,
                        isScrollControlled: true,
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(20),
                          ),
                        ),
                        builder:
                            (_) => Padding(
                              padding:
                                  MediaQuery.of(context).viewInsets +
                                  EdgeInsets.all(16.0),
                              child: ChangeNotifierProvider.value(
                                value: sellVehicleProvider,
                                child: VehicleInfoFormModalStepTue(),
                              ),
                            ),
                      );
                    },
                    child: Text(
                      "Suivant",
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors().white,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      side: BorderSide(color: Colors.deepPurple),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Annuler",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Poppins',
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
        ),
      ),
    );
  }
}
