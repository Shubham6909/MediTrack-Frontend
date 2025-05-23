// import 'package:flutter/material.dart';
//
// class MedicineReminderSetupScreen extends StatefulWidget {
//   const MedicineReminderSetupScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MedicineReminderSetupScreen> createState() =>
//       _MedicineReminderSetupScreenState();
// }
//
// class _MedicineReminderSetupScreenState
//     extends State<MedicineReminderSetupScreen> {
//   final TextEditingController _medicineNameController = TextEditingController();
//   final TextEditingController _dosageController = TextEditingController();
//
//   TimeOfDay _selectedTime = const TimeOfDay(hour: 8, minute: 0);
//   String _selectedDuration = 'Select duration';
//   bool _reminderEnabled = true;
//   bool _isLoading = false;
//
//   final List<String> _durationOptions = [
//     'Select duration',
//     '1 day',
//     '3 days',
//     '1 week',
//     '2 weeks',
//     '1 month',
//     '3 months',
//     'Continuous',
//   ];
//
//   @override
//   void dispose() {
//     _medicineNameController.dispose();
//     _dosageController.dispose();
//     super.dispose();
//   }
//
//   // Format time to display in 12-hour format with AM/PM
//   String _formatTime(TimeOfDay time) {
//     final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
//     final minute = time.minute.toString().padLeft(2, '0');
//     final period = time.period == DayPeriod.am ? 'AM' : 'PM';
//     return '$hour:$minute $period';
//   }
//
//   // Time picker
//   Future<void> _selectTime(BuildContext context) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: _selectedTime,
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: Color(0xFF2196F3),
//               onPrimary: Colors.white,
//               surface: Colors.white,
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//
//     if (pickedTime != null && pickedTime != _selectedTime) {
//       setState(() {
//         _selectedTime = pickedTime;
//       });
//     }
//   }
//
//   // API calls
//   Future<void> _saveMedicineReminder() async {
//     if (_medicineNameController.text.isEmpty ||
//         _dosageController.text.isEmpty ||
//         _selectedDuration == 'Select duration') {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text('Please fill all required fields'),
//           backgroundColor: Colors.red,
//         ),
//       );
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       final Map<String, dynamic> reminderData = {
//         'medicineName': _medicineNameController.text,
//         'dosage': _dosageController.text,
//         'time': '${_selectedTime.hour}:${_selectedTime.minute}',
//         'duration': _selectedDuration,
//         'reminderEnabled': _reminderEnabled,
//       };
//
//       // Simulate API call
//       await Future.delayed(const Duration(seconds: 1));
//
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Reminder saved successfully'),
//             backgroundColor: Colors.green,
//           ),
//         );
//         Navigator.pop(context);
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: ${e.toString()}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     final bool isSmallScreen = screenSize.width < 360;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Blue background
//           Container(
//             height: screenSize.height * 0.15,
//             width: screenSize.width,
//             decoration: const BoxDecoration(
//               color: Color(0xFF2196F3),
//             ),
//           ),
//
//           // Curved white background
//           Positioned(
//             top: screenSize.height * 0.12,
//             child: Container(
//               height: screenSize.height,
//               width: screenSize.width,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//             ),
//           ),
//
//           // Main content
//           SafeArea(
//             child: Column(
//               children: [
//                 // App bar
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       const Text(
//                         'MediTrack',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(width: 48),
//                     ],
//                   ),
//                 ),
//
//                 // Form content
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: screenSize.height * 0.05),
//                           Text(
//                             'Medicine Reminder',
//                             style: TextStyle(
//                               fontSize: isSmallScreen ? 24 : 28,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           SizedBox(height: screenSize.height * 0.03),
//
//                           _buildFormField(
//                             'Medicine Name',
//                             'Enter medicine name',
//                             _medicineNameController,
//                           ),
//                           SizedBox(height: screenSize.height * 0.02),
//
//                           _buildFormField(
//                             'Dosage',
//                             'Enter dosage',
//                             _dosageController,
//                           ),
//                           SizedBox(height: screenSize.height * 0.02),
//
//                           _buildTimeField('Time'),
//                           SizedBox(height: screenSize.height * 0.02),
//
//                           _buildDurationField('Duration'),
//                           SizedBox(height: screenSize.height * 0.03),
//
//                           _buildReminderToggle('Reminder'),
//                           SizedBox(height: screenSize.height * 0.05),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Loading overlay
//           if (_isLoading)
//             Container(
//               color: Colors.black.withOpacity(0.3),
//               child: const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
//                 ),
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _isLoading ? null : _saveMedicineReminder,
//         backgroundColor: const Color(0xFF2196F3),
//         child: const Icon(Icons.check, color: Colors.white),
//       ),
//     );
//   }
//
//   Widget _buildFormField(
//       String label, String hint, TextEditingController controller) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF5FAFF),
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey.shade200),
//           ),
//           child: TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey.shade400),
//               border: InputBorder.none,
//               contentPadding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTimeField(String label) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 8),
//         GestureDetector(
//           onTap: () => _selectTime(context),
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF5FAFF),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.grey.shade200),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   _formatTime(_selectedTime),
//                   style: const TextStyle(fontSize: 16, color: Colors.black87),
//                 ),
//                 const Icon(Icons.keyboard_arrow_down,
//                     color: Colors.grey, size: 18),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDurationField(String label) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF5FAFF),
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey.shade200),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: ButtonTheme(
//               alignedDropdown: true,
//               child: DropdownButton<String>(
//                 value: _selectedDuration,
//                 isExpanded: true,
//                 icon: const Icon(
//                   Icons.keyboard_arrow_down,
//                   color: Colors.grey,
//                   size: 18,
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 onChanged: (value) {
//                   if (value != null) {
//                     setState(() => _selectedDuration = value);
//                   }
//                 },
//                 items: _durationOptions
//                     .map(
//                       (value) => DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: TextStyle(
//                         color: value == 'Select duration'
//                             ? Colors.grey.shade400
//                             : Colors.black87,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildReminderToggle(String label) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         Switch(
//           value: _reminderEnabled,
//           onChanged: (value) {
//             setState(() => _reminderEnabled = value);
//           },
//           activeColor: Colors.white,
//           activeTrackColor: const Color(0xFF2196F3),
//           inactiveThumbColor: Colors.white,
//           inactiveTrackColor: Colors.grey.shade300,
//         ),
//       ],
//     );
//   }
// }


//24-04-2025
// import 'package:flutter/material.dart';
//
// class MedicineReminderSetupScreen extends StatefulWidget {
//   const MedicineReminderSetupScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MedicineReminderSetupScreen> createState() =>
//       _MedicineReminderSetupScreenState();
// }
//
// class _MedicineReminderSetupScreenState
//     extends State<MedicineReminderSetupScreen> {
//   final List<MedicineReminder> _medicines = [
//     MedicineReminder(),
//   ];
//
//   bool _isLoading = false;
//
//   // Check if all required fields are filled for a single medicine
//   bool _isMedicineComplete(MedicineReminder medicine) {
//     return medicine.medicineNameController.text.isNotEmpty &&
//         medicine.dosageController.text.isNotEmpty &&
//         medicine.selectedDuration != 'Select duration' &&
//         medicine.reminderEnabled;
//   }
//
//   // Check if all medicines are complete
//   bool _areAllMedicinesComplete() {
//     return _medicines.isEmpty ||
//         _medicines.every((medicine) => _isMedicineComplete(medicine));
//   }
//
//   // Check if at least one medicine has reminder enabled
//   bool _hasAtLeastOneReminder() {
//     return _medicines.any((medicine) => medicine.reminderEnabled);
//   }
//
//   // Handle submit button click when validation fails
//   void _handleInvalidSubmit() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(
//         content: Text('Please complete all fields for all medicines'),
//         backgroundColor: Colors.red,
//       ),
//     );
//   }
//
//   // API call to save all medicines
//   Future<void> _saveMedicineReminders() async {
//     if (!_areAllMedicinesComplete() || !_hasAtLeastOneReminder()) {
//       _handleInvalidSubmit();
//       return;
//     }
//
//     setState(() {
//       _isLoading = true;
//     });
//
//     try {
//       final List<Map<String, dynamic>> remindersData = _medicines
//           .where((medicine) => medicine.reminderEnabled)
//           .map((medicine) => {
//         'medicineName': medicine.medicineNameController.text,
//         'dosage': medicine.dosageController.text,
//         'time': '${medicine.selectedTime.hour}:${medicine.selectedTime.minute}',
//         'duration': medicine.selectedDuration,
//         'reminderEnabled': medicine.reminderEnabled,
//       })
//           .toList();
//
//       // Simulate API call
//       await Future.delayed(const Duration(seconds: 1));
//
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(
//             content: Text('Reminders saved successfully'),
//             backgroundColor: Colors.green,
//           ),
//         );
//         Navigator.pop(context);
//       }
//     } catch (e) {
//       if (context.mounted) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('Error: ${e.toString()}'),
//             backgroundColor: Colors.red,
//           ),
//         );
//       }
//     } finally {
//       if (mounted) {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
//
//   @override
//   void dispose() {
//     for (var medicine in _medicines) {
//       medicine.dispose();
//     }
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final Size screenSize = MediaQuery.of(context).size;
//     final bool isSmallScreen = screenSize.width < 360;
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           // Blue background
//           Container(
//             height: screenSize.height * 0.15,
//             width: screenSize.width,
//             decoration: const BoxDecoration(
//               color: Color(0xFF2196F3),
//             ),
//           ),
//
//           // Curved white background
//           Positioned(
//             top: screenSize.height * 0.12,
//             child: Container(
//               height: screenSize.height,
//               width: screenSize.width,
//               decoration: const BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.only(
//                   topLeft: Radius.circular(30),
//                   topRight: Radius.circular(30),
//                 ),
//               ),
//             ),
//           ),
//
//           // Main content
//           SafeArea(
//             child: Column(
//               children: [
//                 // App bar
//                 Padding(
//                   padding: const EdgeInsets.symmetric(
//                       horizontal: 16.0, vertical: 8.0),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       const Text(
//                         'MediTrack',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(width: 48),
//                     ],
//                   ),
//                 ),
//
//                 // Form content
//                 Expanded(
//                   child: SingleChildScrollView(
//                     child: Padding(
//                       padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           SizedBox(height: screenSize.height * 0.05),
//                           Text(
//                             'Medicine Reminder',
//                             style: TextStyle(
//                               fontSize: isSmallScreen ? 24 : 28,
//                               fontWeight: FontWeight.bold,
//                               color: Colors.black87,
//                             ),
//                           ),
//                           SizedBox(height: screenSize.height * 0.03),
//
//                           // List of medicines
//                           ..._medicines.asMap().entries.map((entry) {
//                             final index = entry.key;
//                             final medicine = entry.value;
//                             return Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Medicine ${index + 1}',
//                                       style: const TextStyle(
//                                         fontSize: 18,
//                                         fontWeight: FontWeight.w600,
//                                         color: Colors.black87,
//                                       ),
//                                     ),
//                                     if (_medicines.length > 1)
//                                       IconButton(
//                                         icon: const Icon(Icons.delete,
//                                             color: Colors.red),
//                                         onPressed: () {
//                                           setState(() {
//                                             _medicines[index].dispose();
//                                             _medicines.removeAt(index);
//                                           });
//                                         },
//                                       ),
//                                   ],
//                                 ),
//                                 _buildFormField(
//                                   'Medicine Name',
//                                   'Enter medicine name',
//                                   medicine.medicineNameController,
//                                 ),
//                                 SizedBox(height: screenSize.height * 0.02),
//                                 _buildFormField(
//                                   'Dosage',
//                                   'Enter dosage',
//                                   medicine.dosageController,
//                                 ),
//                                 SizedBox(height: screenSize.height * 0.02),
//                                 _buildTimeField('Time', medicine),
//                                 SizedBox(height: screenSize.height * 0.02),
//                                 _buildDurationField('Duration', medicine),
//                                 SizedBox(height: screenSize.height * 0.03),
//                                 _buildReminderToggle('Reminder', medicine),
//                                 SizedBox(height: screenSize.height * 0.05),
//                               ],
//                             );
//                           }).toList(),
//
//                           // Add another medicine button (only if all current medicines are complete)
//                           if (_areAllMedicinesComplete())
//                             Center(
//                               child: TextButton.icon(
//                                 onPressed: () {
//                                   setState(() {
//                                     _medicines.add(MedicineReminder());
//                                   });
//                                 },
//                                 icon: const Icon(Icons.add, color: Color(0xFF2196F3)),
//                                 label: const Text(
//                                   'Add Another Medicine',
//                                   style: TextStyle(
//                                     color: Color(0xFF2196F3),
//                                     fontSize: 16,
//                                     fontWeight: FontWeight.w500,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           SizedBox(height: screenSize.height * 0.05),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//           // Loading overlay
//           if (_isLoading)
//             Container(
//               color: Colors.black.withOpacity(0.3),
//               child: const Center(
//                 child: CircularProgressIndicator(
//                   valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
//                 ),
//               ),
//             ),
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: (_areAllMedicinesComplete() && _hasAtLeastOneReminder() && !_isLoading)
//             ? _saveMedicineReminders
//             : _handleInvalidSubmit,
//         backgroundColor: (_areAllMedicinesComplete() && _hasAtLeastOneReminder() && !_isLoading)
//             ? const Color(0xFF2196F3)
//             : Colors.grey,
//         child: const Icon(Icons.check, color: Colors.white),
//       ),
//     );
//   }
//
//   Widget _buildFormField(
//       String label, String hint, TextEditingController controller) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           width: double.infinity,
//           decoration: BoxDecoration(
//             color: const Color(0xFFF5FAFF),
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey.shade200),
//           ),
//           child: TextField(
//             controller: controller,
//             decoration: InputDecoration(
//               hintText: hint,
//               hintStyle: TextStyle(color: Colors.grey.shade400),
//               border: InputBorder.none,
//               contentPadding:
//               const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             ),
//             onChanged: (_) => setState(() {}), // Update button state
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildTimeField(String label, MedicineReminder medicine) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 8),
//         GestureDetector(
//           onTap: () => _selectTime(context, medicine),
//           child: Container(
//             width: double.infinity,
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF5FAFF),
//               borderRadius: BorderRadius.circular(10),
//               border: Border.all(color: Colors.grey.shade200),
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   _formatTime(medicine.selectedTime),
//                   style: const TextStyle(fontSize: 16, color: Colors.black87),
//                 ),
//                 const Icon(Icons.keyboard_arrow_down,
//                     color: Colors.grey, size: 18),
//               ],
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDurationField(String label, MedicineReminder medicine) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         const SizedBox(height: 8),
//         Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
//           decoration: BoxDecoration(
//             color: const Color(0xFFF5FAFF),
//             borderRadius: BorderRadius.circular(10),
//             border: Border.all(color: Colors.grey.shade200),
//           ),
//           child: DropdownButtonHideUnderline(
//             child: ButtonTheme(
//               alignedDropdown: true,
//               child: DropdownButton<String>(
//                 value: medicine.selectedDuration,
//                 isExpanded: true,
//                 icon: const Icon(
//                   Icons.keyboard_arrow_down,
//                   color: Colors.grey,
//                   size: 18,
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 onChanged: (value) {
//                   if (value != null) {
//                     setState(() {
//                       medicine.selectedDuration = value;
//                     });
//                   }
//                 },
//                 items: medicine.durationOptions
//                     .map(
//                       (value) => DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(
//                       value,
//                       style: TextStyle(
//                         color: value == 'Select duration'
//                             ? Colors.grey.shade400
//                             : Colors.black87,
//                         fontSize: 16,
//                       ),
//                     ),
//                   ),
//                 )
//                     .toList(),
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildReminderToggle(String label, MedicineReminder medicine) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w500,
//             color: Colors.black87,
//           ),
//         ),
//         Switch(
//           value: medicine.reminderEnabled,
//           onChanged: (value) {
//             setState(() {
//               medicine.reminderEnabled = value;
//             });
//           },
//           activeColor: Colors.white,
//           activeTrackColor: const Color(0xFF2196F3),
//           inactiveThumbColor: Colors.white,
//           inactiveTrackColor: Colors.grey.shade300,
//         ),
//       ],
//     );
//   }
//
//   // Format time to display in 12-hour format with AM/PM
//   String _formatTime(TimeOfDay time) {
//     final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
//     final minute = time.minute.toString().padLeft(2, '0');
//     final period = time.period == DayPeriod.am ? 'AM' : 'PM';
//     return '$hour:$minute $period';
//   }
//
//   // Time picker
//   Future<void> _selectTime(BuildContext context, MedicineReminder medicine) async {
//     final TimeOfDay? pickedTime = await showTimePicker(
//       context: context,
//       initialTime: medicine.selectedTime,
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: Color(0xFF2196F3),
//               onPrimary: Colors.white,
//               surface: Colors.white,
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );
//
//     if (pickedTime != null && pickedTime != medicine.selectedTime) {
//       setState(() {
//         medicine.selectedTime = pickedTime;
//       });
//     }
//   }
// }
//
// class MedicineReminder {
//   final TextEditingController medicineNameController = TextEditingController();
//   final TextEditingController dosageController = TextEditingController();
//   TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);
//   String selectedDuration = 'Select duration';
//   bool reminderEnabled = true;
//   final List<String> durationOptions = [
//     'Select duration',
//     '1 day',
//     '3 days',
//     '1 week',
//     '2 weeks',
//     '1 month',
//     '3 months',
//     'Continuous',
//   ];
//
//   void dispose() {
//     medicineNameController.dispose();
//     dosageController.dispose();
//   }
// }



import 'package:flutter/material.dart';

class MedicineReminderSetupScreen extends StatefulWidget {
  const MedicineReminderSetupScreen({Key? key}) : super(key: key);

  @override
  State<MedicineReminderSetupScreen> createState() =>
      _MedicineReminderSetupScreenState();
}

class _MedicineReminderSetupScreenState
    extends State<MedicineReminderSetupScreen> {
  final List<MedicineReminder> _medicines = [
    MedicineReminder(),
  ];

  bool _isLoading = false;

  // Check if all required fields are filled for a single medicine
  bool _isMedicineComplete(MedicineReminder medicine) {
    return medicine.medicineNameController.text.isNotEmpty &&
        medicine.dosageController.text.isNotEmpty &&
        medicine.selectedDuration != 'Select duration' &&
        medicine.reminderEnabled;
  }

  // Check if all medicines are complete
  bool _areAllMedicinesComplete() {
    return _medicines.isEmpty ||
        _medicines.every((medicine) => _isMedicineComplete(medicine));
  }

  // Check if at least one medicine has reminder enabled
  bool _hasAtLeastOneReminder() {
    return _medicines.any((medicine) => medicine.reminderEnabled);
  }

  // Handle submit button click when validation fails
  void _handleInvalidSubmit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Please complete all fields for all medicines'),
        backgroundColor: Colors.red,
      ),
    );
  }

  // API call to save all medicines
  Future<void> _saveMedicineReminders() async {
    if (!_areAllMedicinesComplete() || !_hasAtLeastOneReminder()) {
      _handleInvalidSubmit();
      return;
    }

    setState(() {
      _isLoading = true;
    });

    try {
      final List<Map<String, dynamic>> remindersData = _medicines
          .where((medicine) => medicine.reminderEnabled)
          .map((medicine) => {
        'medicineName': medicine.medicineNameController.text,
        'dosage': medicine.dosageController.text,
        'time': '${medicine.selectedTime.hour}:${medicine.selectedTime.minute}',
        'duration': medicine.selectedDuration,
        'reminderEnabled': medicine.reminderEnabled,
      })
          .toList();

      // Simulate API call
      await Future.delayed(const Duration(seconds: 1));

      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Reminders saved successfully'),
            backgroundColor: Colors.green,
          ),
        );
        Navigator.pop(context);
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    for (var medicine in _medicines) {
      medicine.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final bool isSmallScreen = screenSize.width < 360;
    final double appBarHeight = screenSize.height * 0.15;
    final double curvedOffset = screenSize.height * 0.12;

    return Scaffold(
      body: Stack(
        children: [
          // Blue background
          Container(
            height: appBarHeight,
            width: screenSize.width,
            decoration: const BoxDecoration(
              color: Color(0xFF2196F3),
            ),
          ),

          // Curved white background
          Positioned(
            top: curvedOffset,
            child: Container(
              height: screenSize.height,
              width: screenSize.width,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),

          // Main content
          SafeArea(
            child: Column(
              children: [
                // App bar
                SizedBox(
                  height: appBarHeight - MediaQuery.of(context).padding.top,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const Text(
                          'MediTrack',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 48),
                      ],
                    ),
                  ),
                ),

                // Scrollable form content within white area
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: screenSize.height * 0.05),
                          Text(
                            'Medicine Reminder',
                            style: TextStyle(
                              fontSize: isSmallScreen ? 24 : 28,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: screenSize.height * 0.03),

                          // List of medicines
                          ..._medicines.asMap().entries.map((entry) {
                            final index = entry.key;
                            final medicine = entry.value;
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Medicine ${index + 1}',
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                    ),
                                    if (_medicines.length > 1)
                                      IconButton(
                                        icon: const Icon(Icons.delete,
                                            color: Colors.red),
                                        onPressed: () {
                                          setState(() {
                                            _medicines[index].dispose();
                                            _medicines.removeAt(index);
                                          });
                                        },
                                      ),
                                  ],
                                ),
                                _buildFormField(
                                  'Medicine Name',
                                  'Enter medicine name',
                                  medicine.medicineNameController,
                                ),
                                SizedBox(height: screenSize.height * 0.02),
                                _buildFormField(
                                  'Dosage',
                                  'Enter dosage',
                                  medicine.dosageController,
                                ),
                                SizedBox(height: screenSize.height * 0.02),
                                _buildTimeField('Time', medicine),
                                SizedBox(height: screenSize.height * 0.02),
                                _buildDurationField('Duration', medicine),
                                SizedBox(height: screenSize.height * 0.03),
                                _buildReminderToggle('Reminder', medicine),
                                SizedBox(height: screenSize.height * 0.05),
                              ],
                            );
                          }).toList(),

                          // Add another medicine button (only if all current medicines are complete)
                          if (_areAllMedicinesComplete())
                            Center(
                              child: TextButton.icon(
                                onPressed: () {
                                  setState(() {
                                    _medicines.add(MedicineReminder());
                                  });
                                },
                                icon: const Icon(Icons.add, color: Color(0xFF2196F3)),
                                label: const Text(
                                  'Add Another Medicine',
                                  style: TextStyle(
                                    color: Color(0xFF2196F3),
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: screenSize.height * 0.05),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Loading overlay
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF2196F3)),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (_areAllMedicinesComplete() && _hasAtLeastOneReminder() && !_isLoading)
            ? _saveMedicineReminders
            : _handleInvalidSubmit,
        backgroundColor: (_areAllMedicinesComplete() && _hasAtLeastOneReminder() && !_isLoading)
            ? const Color(0xFF2196F3)
            : Colors.grey,
        child: const Icon(Icons.check, color: Colors.white),
      ),
    );
  }

  Widget _buildFormField(
      String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: const Color(0xFFF5FAFF),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: TextField(
            controller: controller,
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.grey.shade400),
              border: InputBorder.none,
              contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            ),
            onChanged: (_) => setState(() {}), // Update button state
          ),
        ),
      ],
    );
  }

  Widget _buildTimeField(String label, MedicineReminder medicine) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _selectTime(context, medicine),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF5FAFF),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey.shade200),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _formatTime(medicine.selectedTime),
                  style: const TextStyle(fontSize: 16, color: Colors.black87),
                ),
                const Icon(Icons.keyboard_arrow_down,
                    color: Colors.grey, size: 18),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDurationField(String label, MedicineReminder medicine) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF5FAFF),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey.shade200),
          ),
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                value: medicine.selectedDuration,
                isExpanded: true,
                icon: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  size: 18,
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                onChanged: (value) {
                  if (value != null) {
                    setState(() {
                      medicine.selectedDuration = value;
                    });
                  }
                },
                items: medicine.durationOptions
                    .map(
                      (value) => DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(
                        color: value == 'Select duration'
                            ? Colors.grey.shade400
                            : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
                    .toList(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReminderToggle(String label, MedicineReminder medicine) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black87,
          ),
        ),
        Switch(
          value: medicine.reminderEnabled,
          onChanged: (value) {
            setState(() {
              medicine.reminderEnabled = value;
            });
          },
          activeColor: Colors.white,
          activeTrackColor: const Color(0xFF2196F3),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: Colors.grey.shade300,
        ),
      ],
    );
  }

  // Format time to display in 12-hour format with AM/PM
  String _formatTime(TimeOfDay time) {
    final hour = time.hourOfPeriod == 0 ? 12 : time.hourOfPeriod;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = time.period == DayPeriod.am ? 'AM' : 'PM';
    return '$hour:$minute $period';
  }

  // Time picker
  Future<void> _selectTime(BuildContext context, MedicineReminder medicine) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: medicine.selectedTime,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Color(0xFF2196F3),
              onPrimary: Colors.white,
              surface: Colors.white,
            ),
          ),
          child: child!,
        );
      },
    );

    if (pickedTime != null && pickedTime != medicine.selectedTime) {
      setState(() {
        medicine.selectedTime = pickedTime;
      });
    }
  }
}

class MedicineReminder {
  final TextEditingController medicineNameController = TextEditingController();
  final TextEditingController dosageController = TextEditingController();
  TimeOfDay selectedTime = const TimeOfDay(hour: 8, minute: 0);
  String selectedDuration = 'Select duration';
  bool reminderEnabled = true;
  final List<String> durationOptions = [
    'Select duration',
    '1 day',
    '3 days',
    '1 week',
    '2 weeks',
    '1 month',
    '3 months',
    'Continuous',
  ];

  void dispose() {
    medicineNameController.dispose();
    dosageController.dispose();
  }
}



