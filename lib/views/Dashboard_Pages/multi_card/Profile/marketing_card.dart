import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:aecci/views/drawer/custom_drawer.dart';


class MarketingCard extends StatefulWidget {

  final Map<String, dynamic> loginData;
  MarketingCard({required this.loginData});
  @override
  _MarketingCardState createState() =>
      _MarketingCardState();
}

class _MarketingCardState
    extends State<MarketingCard> {
  // Dynamic state variables
  bool receiveEmails = false;
  bool receivePost = false;
  bool receiveCalls = false;

  // List to manage checkboxes for table rows
  List<bool> selectedOptions = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(context: context),
      drawer: CustomDrawer(
        context: context,
        loginData: widget.loginData ?? {},
      ),
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Marketing Information',
            style: TextStyle(
              color: Color(0xFF1748F8),
              fontSize: 18,
              height: 1.2,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFF1748F8),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.home, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.lightbulb_outline, color: Color(0xFF1748F8)),
            onPressed: () {},
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
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
                  backgroundColor: Color(0xFF1748F8),
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