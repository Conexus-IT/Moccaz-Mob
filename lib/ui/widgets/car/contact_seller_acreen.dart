import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/core/utils/decoration.dart';
import 'package:mocaz/providers/car/appointment_provider.dart';
import 'package:mocaz/providers/car/car_provider.dart';
import 'package:provider/provider.dart';

class ContactSellerAcreen extends StatefulWidget {
  const ContactSellerAcreen({super.key});

  @override
  State<ContactSellerAcreen> createState() => _ContactSellerAcreenState();
}

class _ContactSellerAcreenState extends State<ContactSellerAcreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  ScrollController scrollController = ScrollController();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contacter un Vendeur',
          style: TextStyle(fontFamily: 'Poppins', fontSize: 19),
        ),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => AppointmentProvider(),
        child: SingleChildScrollView(
          controller: scrollController,
          padding:
              MediaQuery.of(context).viewInsets + const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Succursale
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Succursale ', style: labelStyle()),
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: AppColors().red),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),
              Consumer<AppointmentProvider>(
                builder:
                    (context, appointmentProvider, child) =>
                        DropdownButtonFormField<String>(
                          value: appointmentProvider.selectedBranch,
                          items:
                              appointmentProvider.branches
                                  .map(
                                    (branch) => DropdownMenuItem(
                                      value: branch,
                                      child: Text(branch),
                                    ),
                                  )
                                  .toList(),
                          onChanged: appointmentProvider.onBranchChanged,
                          validator:
                              (val) => val == null ? 'Champ requis' : null,
                          decoration: inputDecoration("Succursale"),
                        ),
              ),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Nom ', style: labelStyle()),
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: AppColors().red),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),

              // Nom
              Consumer<AppointmentProvider>(
                builder:
                    (context, appointmentProvider, child) => TextFormField(
                      controller: appointmentProvider.nameController,
                      decoration: inputDecoration("Saisir votre nom"),
                      validator:
                          (val) =>
                              val == null || val.isEmpty
                                  ? 'Champ requis'
                                  : null,
                    ),
              ),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Prénom ', style: labelStyle()),
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: AppColors().red),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),

              // Prénom
              Consumer<AppointmentProvider>(
                builder:
                    (context, appointmentProvider, child) => TextFormField(
                      controller: appointmentProvider.firstNameController,
                      decoration: inputDecoration("Saisir votre prénom"),
                      validator:
                          (val) =>
                              val == null || val.isEmpty
                                  ? 'Champ requis'
                                  : null,
                    ),
              ),
              SizedBox(height: 16),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: 'Téléphone ', style: labelStyle()),
                    TextSpan(
                      text: '*',
                      style: TextStyle(color: AppColors().red),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 6),
              Consumer<AppointmentProvider>(
                builder:
                    (context, appointmentProvider, child) => TextFormField(
                      controller: appointmentProvider.phoneController,
                      decoration: inputDecoration("Saisir Votre Téléphone"),
                      keyboardType: TextInputType.phone,
                      validator:
                          (val) =>
                              val == null || val.isEmpty
                                  ? 'Champ requis'
                                  : null,
                    ),
              ),
              SizedBox(height: 16),

              // Date et Heure RDV
              Text(
                "Date et Heure RDV",
                style: TextStyle(
                  color: AppColors().purple,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 6),
              Consumer<AppointmentProvider>(
                builder:
                    (context, appointmentProvider, child) => TextFormField(
                      controller: appointmentProvider.dateTimeController,
                      readOnly: true,
                      onTap: () => appointmentProvider.pickDateTime(context),
                      decoration: inputDecoration(
                        "mm / dd / yyyy , -- : -- --",
                      ).copyWith(
                        suffixIcon: Icon(
                          Icons.calendar_today,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
              ),
              SizedBox(height: 16),
              Text(
                'Souhaitez-vous profiter des offres spéciales de nos partenaires ?',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 6),

              Consumer<AppointmentProvider>(
                builder:
                    (context, appointmentProvider, child) => Row(
                      children: [
                        Text(
                          'NOM',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Radio(
                          value: 'NO',
                          onChanged:
                              (value) => appointmentProvider
                                  .onRadioBottonChanged(value, null),
                          groupValue: appointmentProvider.isCheked,
                        ),
                        Text(
                          'OUI',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16,
                          ),
                        ),
                        Radio(
                          value: 'YES',
                          onChanged:
                              (value) =>
                                  appointmentProvider.onRadioBottonChanged(
                                    value,
                                    scrollController,
                                  ),
                          groupValue: appointmentProvider.isCheked,
                        ),
                      ],
                    ),
              ),
              SizedBox(height: 6),
              Consumer<AppointmentProvider>(
                builder:
                    (context, appointmentProvider, child) =>
                        appointmentProvider.isCheked == 'YES'
                            ? _offerWidget()
                            : SizedBox(),
              ),
              Consumer<AppointmentProvider>(
                builder:
                    (context, appointmentProvider, child) =>
                        appointmentProvider.isCheked == 'YES'
                            ? SizedBox(height: 12)
                            : SizedBox(),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                height: 55,
                color: AppColors().purple,
                textColor: AppColors().white,
                minWidth: double.infinity,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('assets/icons/year.svg'),
                    SizedBox(width: 10),
                    Text(
                      'Soumettre la Demande de rdv',
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
            ],
          ),
        ),
      ),
    );
  }

  Widget _offerWidget() => Container(
    height: 240,
    width: double.infinity,
    decoration: BoxDecoration(
      color: Color(0xFFe3f4fa),
      borderRadius: BorderRadius.circular(12),
    ),

    child: Consumer<AppointmentProvider>(
      builder:
          (context, appointmentProvider, child) => Column(
            children: [
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(
                  left: 10,
                  top: 8,
                  right: 10,
                  bottom: 0,
                ),
                child: Text(
                  'Sélectionnez les offres qui vous intéressent :',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: appointmentProvider.assurance,
                    onChanged:
                        (value) =>
                            appointmentProvider.onAssuranceChecked(value!),
                  ),
                  Text(
                    'Nos offres d’assurances',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: appointmentProvider.guarantees,
                    onChanged:
                        (value) =>
                            appointmentProvider.onGuaranteesChecked(value!),
                  ),
                  Text(
                    'Nos offres de garanties',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: appointmentProvider.assistance,
                    onChanged:
                        (value) =>
                            appointmentProvider.onAssistanceChecked(value!),
                  ),
                  Text(
                    'Nos offres d’assistance',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    value: appointmentProvider.finance,
                    onChanged:
                        (value) => appointmentProvider.onFinanceChecked(value!),
                  ),
                  Text(
                    'Nos formules de financement',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
    ),
  );
}
