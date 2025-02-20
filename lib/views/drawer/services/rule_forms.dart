import 'dart:io';

import 'package:aecci/views/drawer/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: RulesFormsFeesScreen(),
      theme: ThemeData.light(),
    );
  }
}

class RulesFormsFeesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: CustomDrawer(context: context),
      drawer: CustomDrawer(context: context, loginData: {}),
      appBar: AppBar(
        title: Image.asset(
          'assets/images/aecci3.png', // Path to your image asset
          height: 70, // Adjust the height of the image
        ),
        backgroundColor: Colors.white,
        centerTitle: true,
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer(); // Open the drawer
              },
            );
          },
        ),
      ),
      body: ListView(
        children: [
          buildExpansionTile(
            context,
            "Commercial Arbitration Rules and Mediation Procedures",
            ["Rules", "Forms", "Fees"],
          ),
          buildExpansionTile(
            context,
            "Construction Industry Arbitration Rules and Mediation Procedures",
            ["Rules", "Forms", "Fees"],
          ),
          buildExpansionTile(context, "Consumer Arbitration Rules", ["Rules", "Forms", "Fees"]),
          buildExpansionTile(
            context,
            "Employment Arbitration Rules and Mediation Procedures",
            ["Rules", "Forms", "Fees"],
          ),
          buildExpansionTile(context, "Labor Arbitration Rules",["Rules", "Forms", "Fees"]),
          buildExpansionTile(
              context, "International Dispute Resolution Procedures", ["Rules", "Forms", "Fees"]),
          buildExpansionTile(context, "Consumer Mass Arbitration",["Rules", "Forms", "Fees"]),
        ],
      ),
    );
  }

  Widget buildExpansionTile(
      BuildContext context,
      String title,
      List<String> items,
      ) {
    return ExpansionTile(
      title: Text(
        title,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      children: items
          .map(
            (item) => ListTile(
          leading: Icon(Icons.description),
          title: Text(item),
          onTap: item == "Rules"
              ? () => showRulesDialog(context)
              : item == "Forms"
              ? () => showPDF(context, 'assets/forms/aecciform.pdf')
              : item == "Fees"
              ? () => showRulesDialog1(context)
              : null, // Provide a fallback for cases not handled
        ),

      )
          .toList(),
    );
  }

  void showPDF(BuildContext context, String assetPath) async {
    final pdfPath = await copyAssetToFile(assetPath);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(pdfPath),
      ),
    );
  }
  Future<String> copyAssetToFile(String assetPath) async {
    final byteData = await rootBundle.load(assetPath);
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${assetPath.split('/').last}';
    final file = File(filePath);
    await file.writeAsBytes(byteData.buffer.asUint8List());
    return file.path;
  }
}
void showRulesDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 200, // Ensures proper display even with little text
            maxHeight: MediaQuery.of(context).size.height * 0.7, // Limits height to 70% of screen
            maxWidth: MediaQuery.of(context).size.width * 0.9, // Limits width to 90% of screen
          ),
          child: Padding(
            padding: const EdgeInsets.all(16), // Added padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Rule Document",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "PART I: INTRODUCTION",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Article 1: Introduction",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "1.1 To frame, amend such Arbitration Rules to hereby govern the conduct of Arbitration Proceeding held at AECCI- International Arbitration Centre, India relating to International Commercial Arbitration and International Maritime Arbitration and for matters connected therewith or incidental thereto.\n\n"
                              "1.2 By consenting to use the above Arbitration Rules to hereby govern the arbitration proceedings, to be conducted at the AECCI- IAC, Navi Mumbai, India the parties hereby further agree, acknowledge, and accept these rules or any revised rules framed thereafter approved by Council AECCI- IAC Navi Mumbai, India. And in the event of any dispute arising between a relevant rule and an express provision of applicable law hereby governing the Conduct of Arbitration Proceedings between the Parties to Arbitration, then the express provision of applicable/ governing law shall prevail over said relevant rule.\n\n"
                              "1.3 The Arbitration Rules shall hereby deem to commence from such date as unanimously agreed upon by the Council AECCI- IAC.\n\n"
                              "1.4 These Arbitration Rules shall govern any and all arbitration proceedings initiated on or after April, 2023, unless otherwise agreed upon by the Council AECCI- IAC, India to fix different dates of commencement of said Rules.",
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Article 2: Definition",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "a. “Arbitration” means any arbitration whether or not administered by permanent arbitral institution; any arbitration arising out of International Disputes.\n\n"
                              "b. “Arbitration agreement” means an arbitration agreement may be in the form of an arbitration clause in a contract or in the form of a separate agreement.\n\n"
                              "c. “Award” includes any final decision made by the arbitrator(s), including emergency arbitrators.",
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Article 3: Applicable Law",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "Amendments: 1. The Tribunal shall apply the Law of Arbitration and Conciliation Act, 1996 and/or if the parties determine and agree that the arbitrator is relying on morally fair, just & commercially accepted rules and principles shall apply for the arbitration proceedings. Failing which the Tribunal shall apply the law and/or rules of law which it determines to be appropriate for an unprejudiced dictum.\n\n"
                              "2. The Tribunal shall decide as amiable compositeur or ex aequo et bono only if the parties have expressly authorised the Tribunal to do so. (“Amiable compositeur or ex aequo et bono” means dispute settlement where parties expressly agree that the Arbitrator is not bound by strict rules of law but based on fair, just and moral dictum and commercially accepted principles only if the parties have expressly authorised the Tribunal to do so.)\n\n"
                              "3. In all cases, the Tribunal shall decide in accordance with the terms of the contract, if any, and shall take into account any usage of trade applicable to the transaction to the extent that the Tribunal considers it relevant to the arbitration proceedings.",
                        ),

                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

void showRulesDialog1(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 200, // Ensures it does not collapse
            maxHeight: MediaQuery.of(context).size.height * 0.7, // Prevents excessive height
            maxWidth: MediaQuery.of(context).size.width * 0.9, // Limits width to 90% of screen
          ),
          child: Padding(
            padding: const EdgeInsets.all(16), // Added padding
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Fee Document",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "As an institution that offers impartial and efficient dispute resolution services, the AECCI International Arbitration Center provides a transparent fee schedule to ensure that parties involved in the arbitration process have a clear understanding of the costs involved.\n\n"
                              "The fee schedule covers the costs associated with the administration of arbitration proceedings, including filing case fees, administration fees, arbitrator fees, and emergency interim relief fees.\n\n"
                              "It is important to note that the fees outlined in the schedule are subject to change and may vary depending on the specific circumstances of the dispute. Parties involved in the arbitration process are encouraged to consult with the AECCI International Arbitration Center directly to obtain the most up-to-date fee information.\n\n"
                              "This Schedule of Fees is effective as of 13.04.2023 and is applicable to all arbitrations commenced on or after 13.04.2023. This Schedule of Fees may be amended from time to time and any revised Schedule of Fees shall take effect as of the date determined by the AECCI Management.",
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Filing Case Fee",
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(height: 4),
                        Text("USD 300 (FOR AECCI-MEMBERS)\nUSD 400 (FOR AECCI-NON-MEMBERS)"),
                        Text(
                          "*Client/Applicant must be registered as Member of AECCI, if Non-Member then Fees shall be applicable as above.",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 12),
                        Center(
                          child: Text(
                            "Administration Fees",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "The administration fees calculated in accordance with the Schedule below apply to all arbitrations administered by AECCI-IAC and is the maximum amount payable to AECCI-IAC.",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 6),
                        Text(
                          "a. “Arbitration” means any arbitration whether or not administered by permanent arbitral institution; any arbitration arising out of International Disputes.\n\n"
                              "b. “Arbitration agreement” means an arbitration agreement may be in the form of an arbitration clause in a contract or in the form of a separate agreement.\n\n"
                              "c. “Award” includes any final decision made by the arbitrator(s), including emergency arbitrators.",
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Navigator.pop(context),
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Close',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}

class PDFViewerScreen extends StatelessWidget {
  final String pdfPath;

  PDFViewerScreen(this.pdfPath);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("AECCI Arbitration Form"),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 1,
      ),
      body: FutureBuilder<bool>(
        future: File(pdfPath).exists(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !(snapshot.data ?? false)) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 48),
                  SizedBox(height: 16),
                  Text(
                    "PDF form is not available",
                    style: TextStyle(color: Colors.red, fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Go Back"),
                  ),
                ],
              ),
            );
          }

          return PDF().cachedFromUrl(
            pdfPath,
            placeholder: (double progress) => Center(
              child: CircularProgressIndicator(
                value: progress,
              ),
            ),
            errorWidget: (dynamic error) => Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.error_outline, color: Colors.red, size: 48),
                  SizedBox(height: 16),
                  Text(
                    "Failed to load PDF form",
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 8),
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Go Back"),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

// Update the showPDF function with better error handling
void showPDF(BuildContext context, String assetPath) async {
  try {
    final pdfPath = await copyAssetToFile(assetPath);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PDFViewerScreen(pdfPath),
      ),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Unable to load the PDF form. Please try again later."),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}

Future<String> copyAssetToFile(String assetPath) async {
  try {
    final byteData = await rootBundle.load(assetPath);
    final directory = await getApplicationDocumentsDirectory();
    final filePath = '${directory.path}/${assetPath.split('/').last}';
    final file = File(filePath);
    await file.writeAsBytes(byteData.buffer.asUint8List());
    return file.path;
  } catch (e) {
    throw Exception('Failed to load PDF file: $e');
  }
}