import 'package:flutter/material.dart';

class ScheduleFees extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Schedule Fees',
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.purple,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoCard(
                icon: Icons.local_offer_outlined,
                title: 'Schedule Fees',
                content: 'Discover AECCI International Arbitration Center’s schedule fees for expert dispute resolution services.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.cases_rounded,
                title: 'Filing Case Fee',
                content: 'USD 300 (FOR AECCI-MEMBERS)\nUSD 400 (FOR AECCI- NON-MEMBERS)',
                isExpandable: false,
              ),
              Card(
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
                          Icon(Icons.cases_rounded, color: Colors.purple, size: 28),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Administration Fees',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildFeesTable(),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Card(

                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.cases_rounded, color: Colors.purple, size: 28),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: Text(
                              'Arbitrator’s Fees',
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      _buildFeesTable1(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeesTable() {
    return Table(
      border: TableBorder.all(color: Colors.black54),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
      },
      children: [
        _buildTableRow('Quantum of Claim (USD)', 'Fee (USD)', isHeader: true),
        _buildTableRow('UP TO 75,000', '1,375'),
        _buildTableRow('75,001 to 2,00,000', '2,000 + 1.5% over 75,000'),
        _buildTableRow('2,00,001 to 7,00,000', '2,800 + 1.4% over 2,00,001'),
        _buildTableRow('7,00,001 to 12,00,000', '7,000 + 1.3% over 7,00,001'),
        _buildTableRow('12,00,001 to 22,00,000', '10,000 + 1% over 12,00,001'),
        _buildTableRow('22,00,001 to 62,00,000', '12,000 + 0.80% over 22,00,001'),
        _buildTableRow('62,00,001 to 1,25,00,000', '20,000 + 0.75% over 62,00,001'),
        _buildTableRow('Above 1,25,00,001', '50,000 + 0.50% over 1,25,00,001'),
      ],
    );
  }

  Widget _buildFeesTable1() {
    return Table(
      border: TableBorder.all(color: Colors.black54),
      columnWidths: const {
        0: FlexColumnWidth(2),
        1: FlexColumnWidth(1),
      },
      children: [
        _buildTableRow('Quantum of Claim (USD)', 'Fee (USD)', isHeader: true),
        _buildTableRow('UP TO 75,000', '1,218'),
        _buildTableRow('75,001 to 2,00,000', '2343 + 3% over 75,001'),
        _buildTableRow('2,00,001 to 7,00,000', '4218 + 1% over 2,00,001'),
        _buildTableRow('7,00,001 to 12,00,000', '9218 + 1% over 7,00,001'),
        _buildTableRow('12,00,001 to 22,00,000', '15468 + 0.75% over 12,00,001'),
        _buildTableRow('22,00,001 to 62,00,000', '24,843 + 0.5% over 22,00,001'),
        _buildTableRow('62,00,001 and above', '( Contact Chamber Desk)'),
        _buildTableRow('Above 1,25,00,001', '50,000 + 0.50% over 1,25,00,001'),
      ],
    );
  }

  TableRow _buildTableRow(String col1, String col2, {bool isHeader = false}) {
    return TableRow(
      decoration: isHeader ? BoxDecoration(color: Colors.purple.shade400) : null,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(col1, style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(col2, style: TextStyle(fontWeight: isHeader ? FontWeight.bold : FontWeight.normal)),
        ),
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
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
                Icon(icon, color: Colors.purple, size: 28),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(fontSize: 16, height: 1.5, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
