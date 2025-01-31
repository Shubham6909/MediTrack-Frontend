import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';


class MarketingInformationScreen extends StatefulWidget {
  @override
  _MarketingInformationScreenState createState() =>
      _MarketingInformationScreenState();
}

class _MarketingInformationScreenState
    extends State<MarketingInformationScreen> {
  // Dynamic state variables
  bool receiveEmails = false;
  bool receivePost = false;
  bool receiveCalls = false;

  // List to manage checkboxes for table rows
  List<bool> selectedOptions = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(context: context),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/AECCI Logo (1).png', // Path to your image asset
          height: 55, // Adjust the height of the image
        ),
        backgroundColor: const Color(0xFF20533A),
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),

      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // First card for "I am happy" checkboxes
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Add the Member Information text
                    Text(
                      "Member Information",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                     // Add spacing between the title and the checkboxes
                    _buildCheckboxTile(
                      "I AM HAPPY TO RECEIVE E-MAILS",
                      receiveEmails,
                          (value) {
                        setState(() {
                          receiveEmails = value!;
                        });
                      },
                    ),
                    _buildCheckboxTile(
                      "I AM HAPPY TO RECEIVE POST",
                      receivePost,
                          (value) {
                        setState(() {
                          receivePost = value!;
                        });
                      },
                    ),
                    _buildCheckboxTile(
                      "I AM HAPPY TO RECEIVE CALLS",
                      receiveCalls,
                          (value) {
                        setState(() {
                          receiveCalls = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 8),

            // Second card for "Particulars" with email on the right
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: List.generate(7, (index) {
                    return _buildTableRow(
                      [
                        "Particulars",
                        "AECCI Marketing Campaigns",
                        "Chamber Awards",
                        "Chamber Weekly Bullets",
                        "Event Updates",
                        "Annual Magazines",
                        "Quarterly/Weekly Newsletter Distribution",
                        "Sponsorship & Advertising Opportunities",
                      ][index],
                      index,
                    );
                  }),
                ),
              ),
            ),
            SizedBox(height: 8),

            // Update button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Your update logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                child: Text(
                  'Update',
                  style: TextStyle(
                    fontSize: 16, // Reduced font size
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCheckboxTile(
      String title, bool value, ValueChanged<bool?> onChanged) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade800,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Checkbox(
          value: value,
          onChanged: onChanged,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          activeColor: Colors.blue,
        ),
      ],
    );
  }

  Widget _buildTableRow(String title, int index) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Text(
              title,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade800,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          if (index != 0) // Skip checkbox for the first row (Particulars)
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [

                  Checkbox(
                    value: selectedOptions[index],
                    onChanged: (value) {
                      setState(() {
                        selectedOptions[index] = value!;
                      });
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4),
                    ),
                    activeColor: Colors.blue,
                  ),
                ],
              ),
            )
          else // Display "Email" text only for the first row
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey.shade800,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }

}
