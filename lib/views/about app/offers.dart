import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Enrollment',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.purple, // Rich header color
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.purple, Colors.deepPurpleAccent],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                icon: Icons.local_offer_rounded,
                title: 'Enrollment Offers',
                content:
                '“Considering the service needs of the custom house agents and creating a network for our exporter members we created the opportunity for them to drop in enrolment application online and get enrolled with AECCI”',
                isExpandable: false, // No need for show more/less
              ),
              InfoCard(
                icon: Icons.note_add_rounded,
                title: 'NOTE',
                content:
                'Considering the service needs of the Custom’s clearing agents and to creating a network for our exporter members while assisting them in fulfilling their logistics and custom clearance needs, AECCI has launched a special drive called “Non-Enrolled Members” where the custom clearing agents having their license can enrol with us.Under this NME drive, we keep the CHAs updated with day-to-day news and notification released by the Indian customs and the O/o Director General of Foreign Trade.\nWe facilitate our far distant exporter members for their Coo (NP) and documents attestation needs by providing the services through their authorised Clearing agents.AECCI has decided to charge only admin fees for the registration of Non Member Enrolled. By paying a very nominal fee Custom House Agents can be enrolled with us for a lifetime.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.info_outline_rounded,
                title: 'AECCI revolving information',
                content: '“AECCI creates an environment for the members to build mutually beneficial and lasting business'
                    'relationships through various Support\n'
                    'AECCI introduced Revolving Credit Facility for Exporters and CHA’s\n'
                    'In this facility, AECCI shall open a revolving ledger account of the Exporter / CHA. The Exporter / CHA may give an initial amount of Rs. 5,000/- as deposit to the Chamber.'
                    'Thereafter, whenever documents are brought for attestation, the charges will be automatically debited from the Exporter/CHAs ledger. A receipt to this effect would be generated to give the balance credit available..',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.info_outline_rounded,
                title: 'AECCI facility information',
                content: '“With reference to that I ask my Dear Member to keep a credit revolving'
                    'Account facility in our Organisation. By this, it will be easy for you as well as'
                    'for us to keep the records of accounts Efficiently rather than paying separately for '
                    'each document, we can deduct the amount from your ledger account itself and send you '
                    'excel sheet of ledger regularly\n.You may even call the chamber the desk and ask for your ledger balances time to time.'
                    '\nMaximum deposit amount should be Rs.5000/-\n'
                    'If your Volume of document are less in a month you can deposit minimum amount of Rs.3000/-“',
                isExpandable: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String content;
  final bool isExpandable;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.content,
    this.isExpandable = false,
  }) : super(key: key);

  @override
  _InfoCardState createState() => _InfoCardState();
}

class _InfoCardState extends State<InfoCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(widget.icon, color: Colors.purple, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            if (widget.isExpandable)
              AnimatedCrossFade(
                firstChild: Text(
                  '${widget.content.substring(0, 100)}...', // Show first 100 characters
                  style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                ),
                secondChild: Text(
                  widget.content,
                  style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
                ),
                crossFadeState: isExpanded ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              )
            else
              Text(
                widget.content,
                style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
              ),
            if (widget.isExpandable)
              TextButton(
                onPressed: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(isExpanded ? "Show Less" : "Show More"),
              ),
          ],
        ),
      ),
    );
  }
}
