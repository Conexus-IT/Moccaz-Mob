import 'package:flutter/material.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/core/utils/form_validator.dart';
import 'package:mocaz/providers/car/car_provider.dart';
import 'package:mocaz/providers/car/sell_vehicle_provider.dart';
import 'package:mocaz/routes/app_router.dart';
import 'package:mocaz/routes/app_routes.dart';
import 'package:mocaz/routes/navigation_service.dart';
import 'package:provider/provider.dart';

class VehicleInfoFormModalStepTue extends StatefulWidget {
  @override
  _VehicleInfoFormModalState createState() => _VehicleInfoFormModalState();
}

class _VehicleInfoFormModalState extends State<VehicleInfoFormModalStepTue> {
  final _formKey = GlobalKey<FormState>();
  Widget buildDropdown(
    String label,
    String? value,
    List<String> items,
    void Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            fontFamily: 'Poppins',
            color: AppColors().purple,
            fontSize: 15,
          ),
        ),
        SizedBox(height: 6),
        DropdownButtonFormField<String>(
          validator:
              (val) => val == null || val.isEmpty ? 'Champ requis' : null,
          value: value,
          isExpanded: true,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
          ),
          icon: Icon(Icons.keyboard_arrow_down_rounded),
          items:
              items
                  .map(
                    (item) => DropdownMenuItem(value: item, child: Text(item)),
                  )
                  .toList(),
          onChanged: onChanged,
        ),
        SizedBox(height: 16),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final SellVehicleProvider sellVehicleProvider =
        Provider.of<SellVehicleProvider>(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 50),
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
              SizedBox(height: 12),
              Text(
                'Renseignez les informations de votre véhicule et découvrez son prix estimatif !',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,

                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),

              buildDropdown(
                "Sélectionnez l'année de votre véhicule *",
                sellVehicleProvider.selectedYear,
                sellVehicleProvider.years,
                (val) => sellVehicleProvider.onYearChnaged,
              ),
              buildDropdown(
                "Sélectionnez la puissance de votre moteur *",
                sellVehicleProvider.selectedPower,
                sellVehicleProvider.powers,
                (val) => sellVehicleProvider.onPawerChnaged,
              ),
              buildDropdown(
                "Sélectionnez la boîte de vitesses *",
                sellVehicleProvider.selectedTransmission,
                sellVehicleProvider.transmissions,
                (val) => sellVehicleProvider.onTransmitionChnaged,
              ),
              buildDropdown(
                "Sélectionnez le type de carburant *",
                sellVehicleProvider.selectedFuel,
                sellVehicleProvider.fuels,
                (val) => sellVehicleProvider.onFuelChnaged,
              ),
              buildDropdown(
                "Combien de kilomètres a votre véhicule *",
                sellVehicleProvider.selectedMileage,
                sellVehicleProvider.mileages,
                (val) => sellVehicleProvider.onMileageChnaged,
              ),
              buildDropdown(
                "Sélectionnez la marque de votre véhicule *",
                sellVehicleProvider.selectedBrand,
                sellVehicleProvider.brands,
                (val) => sellVehicleProvider.onBrandChnaged,
              ),
              buildDropdown(
                "Sélectionnez le modèle de votre véhicule *",
                sellVehicleProvider.selectedModel,
                sellVehicleProvider.models,
                (val) => sellVehicleProvider.onModelChnaged,
              ),

              SizedBox(height: 10),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors().primaryCyan,
                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed:
                          () => Navigator.pop(
                            context,
                          ), // Could show first modal again
                      child: Text(
                        "Précédent",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors().purple,

                        minimumSize: Size(double.infinity, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (FormValidators.validateForm(context, _formKey)) {
                          Navigator.pushNamedAndRemoveUntil(
                            context,
                            AppRoutes.success,
                            (value) => true,
                          );
                        }
                      },

                      child: Text(
                        "Suivant",
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Poppins',
                          color: AppColors().white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
