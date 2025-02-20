import 'package:flutter/material.dart';
import '../../../dashboard.dart';

class ApplicationLetterForm extends StatefulWidget {
  final Map<String, dynamic>? loginData;
  final Map<String, dynamic>? getData;
  final String token;

  const ApplicationLetterForm({
    this.loginData,
    this.getData,
    required this.token,
    Key? key,
  }) : super(key: key);

  @override
  State<ApplicationLetterForm> createState() => _ApplicationLetterFormState();
}

class _ApplicationLetterFormState extends State<ApplicationLetterForm> {
  String? selectedRegion;
  String? selectedCountry;
  String? selectedAddress;
  final TextEditingController _fullAddressController = TextEditingController();

  // Sample data - Replace with actual data from your backend
  final List<String> regions = ['North America', 'Europe', 'Asia', 'Africa'];
  final List<String> countries = ['USA', 'UK', 'Canada', 'Australia'];
  final List<String> addresses = ['Embassy', 'High Commission', 'Consulate'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'assets/images/logo.png',
          height: 50,
          fit: BoxFit.contain,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
        actions: [
          IconButton(
            icon: const CircleAvatar(
              backgroundColor: Colors.blue,
              child: Icon(
                Icons.dashboard,
                color: Colors.white,
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DashboardScreen(
                    loginData: widget.loginData,
                    getData: widget.getData,
                    token: widget.token,
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.white, // Set background color to white
          // padding: const EdgeInsets.all(4.0),
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 1.95, // Increase width
              ),
              child: Card(
                color: Colors.white, // Set card color to white
                elevation: 4,
                margin: const EdgeInsets.all(16),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(16.0),
                        // color: Colors.grey[200],
                        child: const Text(
                          'APPLICATION FOR RECOMMENDATION LETTER',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8), // Reduced height
                      Row(
                        children: [
                          Expanded(
                            child: _buildDropdownField(
                              label: 'Region*',
                              value: selectedRegion,
                              items: regions,
                              onChanged: (value) {
                                setState(() {
                                  selectedRegion = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: _buildDropdownField(
                              label: 'Country*',
                              value: selectedCountry,
                              items: countries,
                              onChanged: (value) {
                                setState(() {
                                  selectedCountry = value;
                                });
                              },
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8), // Reduced height
                      _buildDropdownField(
                        label: 'Addresses to',
                        value: selectedAddress,
                        items: addresses,
                        onChanged: (value) {
                          setState(() {
                            selectedAddress = value;
                          });
                        },
                      ),
                      const SizedBox(height: 8), // Reduced height
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Full Address',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: _fullAddressController,
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              hintText: 'Enter complete address',
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Note: Enter the Correct Location address of High Commissions/Embassy/Consulate',
                            style: TextStyle(
                              color: Colors.red[700],
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        DropdownButtonFormField<String>(
          value: value,
          items: items.map((String item) {
            return DropdownMenuItem(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 8,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _fullAddressController.dispose();
    super.dispose();
  }
}