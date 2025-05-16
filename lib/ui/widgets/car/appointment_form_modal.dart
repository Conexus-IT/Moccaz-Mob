import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mocaz/core/constants/colors.dart';
import 'package:mocaz/providers/car/appointment_provider.dart';
import 'package:mocaz/routes/navigation_service.dart';
import 'package:provider/provider.dart';

class AppointmentFormModal extends StatefulWidget {
  @override
  _AppointmentFormModalState createState() => _AppointmentFormModalState();
}

class _AppointmentFormModalState extends State<AppointmentFormModal> {
  final _formKey = GlobalKey<FormState>();

  InputDecoration _inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      filled: true,
      fillColor: Colors.grey[100],
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      contentPadding: EdgeInsets.symmetric(horizontal: 14, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppointmentProvider(),
      child: Padding(
        padding: MediaQuery.of(context).viewInsets + const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(backgroundColor: AppColors().white),
                    Center(
                      child: Text(
                        'Prendre un rendez-vous',
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

                SizedBox(height: 20),

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
                            decoration: _inputDecoration("Succursale"),
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
                        decoration: _inputDecoration("Saisir votre nom"),
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
                        decoration: _inputDecoration("Saisir votre prénom"),
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
                      TextSpan(text: 'Email ', style: labelStyle()),
                      TextSpan(
                        text: '*',
                        style: TextStyle(color: AppColors().red),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 6),

                // Email
                Consumer<AppointmentProvider>(
                  builder:
                      (context, appointmentProvider, child) => TextFormField(
                        controller: appointmentProvider.emailController,
                        decoration: _inputDecoration("Votre email"),
                        keyboardType: TextInputType.emailAddress,
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

                // Téléphone
                Consumer<AppointmentProvider>(
                  builder:
                      (context, appointmentProvider, child) => TextFormField(
                        controller: appointmentProvider.phoneController,
                        decoration: _inputDecoration("Saisir Votre Téléphone"),
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
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Date et Heure RDV",
                    style: TextStyle(
                      color: AppColors().purple,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                SizedBox(height: 6),
                Consumer<AppointmentProvider>(
                  builder:
                      (context, appointmentProvider, child) => TextFormField(
                        controller: appointmentProvider.dateTimeController,
                        readOnly: true,
                        onTap: () => appointmentProvider.pickDateTime(context),
                        decoration: _inputDecoration(
                          "mm / dd / yyyy , -- : -- --",
                        ).copyWith(
                          suffixIcon: Icon(
                            Icons.calendar_today,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                ),
                SizedBox(height: 24),

                // Buttons
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors().purple,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            print("✅ Form is valid");
                            // Submit logic here
                          }
                        },
                        child: Text(
                          "Confirmer le rendez-vous",
                          style: TextStyle(
                            color: AppColors().white,

                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors().primaryCyan,
                          padding: EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () => Navigator.pop(context),
                        child: Text(
                          "Fermer",
                          style: TextStyle(
                            color: AppColors().purple,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 12),
              ],
            ),
          ),
        ),
      ),
    );
  }

  TextStyle hintStyle() =>
      TextStyle(fontFamily: 'Poppins', fontWeight: FontWeight.w300);

  TextStyle labelStyle() => TextStyle(
    color: AppColors().black,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.w600,
  );
}
