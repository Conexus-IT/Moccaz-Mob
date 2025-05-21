import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentProvider extends ChangeNotifier {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateTimeController = TextEditingController();

  String? selectedBranch = 'Succursale Bandeong';

  // this var for radio botton for yes or no
  String _isCheked = 'YES';

  // those checkbox variables for offres widget

  bool assurance = true;
  bool guarantees = true;
  bool assistance = true;
  bool finance = true;

  String get isCheked => _isCheked;
  final List<String> branches = [
    'Succursale Bandeong',
    'Succursale Casablanca',
    'Succursale Rabat',
  ];

  Future<void> pickDateTime(BuildContext context) async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now().add(Duration(days: 1)),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      TimeOfDay? time = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.now(),
      );

      if (time != null) {
        final dateTime = DateTime(
          date.year,
          date.month,
          date.day,
          time.hour,
          time.minute,
        );
        dateTimeController.text = DateFormat(
          'dd/MM/yyyy, HH:mm',
        ).format(dateTime);
      }
    }
  }

  void onBranchChanged(String? newBranch) {
    selectedBranch = newBranch;
    notifyListeners();
  }

  onRadioBottonChanged(String? value, ScrollController? scrollController) {
    _isCheked = value!;
    notifyListeners();

    if (scrollController != null) {
      scrollController.animateTo(
        scrollController.offset + 180, // Scrolls down by 300 pixels
        duration: Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  onAssuranceChecked(bool value) {
    assurance = value;
    notifyListeners();
  }

  onGuaranteesChecked(bool value) {
    guarantees = value;
    notifyListeners();
  }

  onAssistanceChecked(bool value) {
    assistance = value;
    notifyListeners();
  }

  onFinanceChecked(bool value) {
    finance = value;
    notifyListeners();
  }
}
