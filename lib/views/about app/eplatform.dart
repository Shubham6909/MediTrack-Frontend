import 'package:flutter/material.dart';

class Eplatform extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About e-Platform  Information',
          style: TextStyle(color: Colors.white, fontSize: 20),
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
                icon: Icons.confirmation_number_rounded,
                title: 'e-Platform  Information',
                content:
                'Online service for all the transactions while replacing the customer’s need to visit Chamber physically. The online attestation service can be availed through the chamber’s website or its smart application.',
                isExpandable: false,
              ),
              InfoCard(
                icon: Icons.play_circle_fill_rounded,
                title: 'AECCI e-Platform',
                content:
                'The Asian Exporters’ Chamber of Commerce (AECCI) initiated its e-platform in 2020 and recently introduced its upgraded version, Version 2.0, on April 1, 2024. This endeavor aims to provide online services catering to all exporter needs, with the vision of offering accessible digital services anytime, anywhere. These e-platform services can be accessed via the chamber’s website, optimized for desktop viewing.Please note that AECCI e-Platform services are exclusively available to our registered members. Upon membership approval, members gain access to a comprehensive array of support and benefits designed to propel their businesses forward.At AECCI, we are committed to assisting you in various aspects, including brand awareness, generating new business opportunities, expanding your network, training your personnel, and accessing international markets. Additionally, members can benefit from AECCI’s diverse range of services and programs aimed at fostering business growth\n\nThese are the types of memberships which are available in our platform:\n⦁ Small Business Membership\n⦁ Start-Up Membership\n⦁ Corporate Membership\n⦁ Corporate+ Membership\n⦁ Overseas Membership\n\nMembers can enjoy the below-listed services through AECCI’s E-Platform',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.center_focus_strong_rounded,
                title: 'Certificate of origin service',
                content:
                'The Certificate of Origin serves as document facilitating the export of goods to different countries. Economic agreements dictate the use of specific forms, which when submitted, enable customs exemptions or discounted customs duties as per trade agreements ratified by India.Our E-Service streamlines the application process for obtaining a Non-Preferential Certificate of Origin, allowing exporters to export or re-export goods from India efficiently.Chamber members have access to apply for this service. Additionally, non-members can avail themselves of this service for the first three months only (as per free enrolment).\nFollowing are the ways in which the shipping documents can be attested:\n'
                    'A) Manual Attestation (at the chamber desk)\nCertificate of origin attestation can be obtained through manual attestation at the chamber desk. Applicants can collect stationery from the chamber, print it at their office premises, and then submit it at the chamber desk for physical attestation.\nB) Electronic Certificate of Origin (eCO)\nAnother option is to obtain an electronic certificate of origin through AECCI’s E-Platform. Users can digitally register their company, fill out the eCO form online, and submit it. Within 20 minutes of submission, the eCO is attested, and users can view it in their“Track Your Document” section.\nC) Semi-Electronic COO\nFor users who require urgent manual attestation on shipping documents but cannot visit the chamber, there is the option of semi-electronic COO. Users can fill out the required fields and upload documents online. Exporters, especially those in remote areas, can conveniently utilize our semi-electronic Certificate of Origin service (printing at the chamber with courier facility).',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.confirmation_number_rounded,
                title: 'Non-Standard Documents',
                content:
                'Exporters in the pharmaceutical, chemical, and agrochemical industries can easily obtain attestation through our non-standard document services on the E-Platform. Documents such as agreements, pharmaceutical registration documents, and dossiers can be attested hassle-free. AECCI has extended its digital attetation services to include non-standard documents such as commercial documents, distribution or sales agreements,\npharmaceutical registration documents, agrochemical documents, export permission- related documents, MCA documents, and more. These documents can now be electronically attested via AECCI’s E-Platform. Users are required to review the applicable terms and conditions for these documents to facilitate a smoother process.\n\nNote: Users can print their documents through “e- Platform” online',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.confirmation_number_rounded,
                title: 'Membership Service and Renewals',
                content:
                'AECCI members can now conveniently renew their membership hassle-free via the e- platform at their discretion. Membership renewal options include 1 year, 3 years, or 5 years, allowing members flexibility according to their preferences. Within this section, members can easily access and view their membership certificates.\n\nRegistered Members have the flexibility to log in to their accounts at any time to verify their membership status. Membership is initially granted for a year and automatically renewed annually thereafter. It is strongly recommended that all members renew their memberships before the 31st of March each calendar year to avoid any interruption and continue benefiting from the various services and advantages provided by the chamber. Renewing your membership has never been easier; simply pay your renewal fees online and enjoy immediate renewal.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.confirmation_number_rounded,
                title: 'Recommendation Letters',
                content:
                'Obtaining a visa recommendation letter has now been simplified. Applicants/members no longer need to visit the chamber or endure lengthy queues to obtain their recommendation letters. Instead, they can conveniently log in to their profile dashboard, complete the necessary form, and submit the required documents online. Upon successful submission of all details, users can track their application status through the progress bar. The issuance of digital recommendation letters will be promptly displayed on their dashboard within an hour. During the form submission process, users can select their preferred mode of delivery, and the recommendation letter will be issued accordingly',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.confirmation_number_rounded,
                title: 'Commercial Directory',
                content:
                'Members have the privilege of accessing the chamber’s digital directory. To have their company listed in the directory, users are required to provide their company details and await confirmation from AECCI Authority. Once approved, the company’s details will be displayed in the digital directory.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.wallet,
                title: 'Wallet',
                content:
                'The Wallet serves as the core of the ePlatform, acting as a central hub for transactions. Prior to utilizing any transactional service, users must ensure that their wallet contains a sufficient balance. Users are encouraged to maintain a revolving balance by regularly recharging or adding funds to their wallet. All transactions processed through the ePlatform, such as membership renewals, eCo attestations, or issuance of recommendation letters, are debited from the wallet. Users can conveniently track each debit or credit entry in their wallet, and access their transaction history for download.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.rowing_sharp,
                title: 'Wings',
                content:
                'AECCI’s Wings provide comprehensive support to your business through various divisions, including the Legal Wing, Export Wing, Professional Wing, HR Support Wing, and more. With our digital array of services, users can now seek consultation from AECCI professionals online. They can digitally submit their queries and receive appointments or solutions online, streamlining the process for their convenience.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.confirmation_number_rounded,
                title: 'Arbitration',
                content:
                'In the event of any dispute arising from a contract or agreement between parties, AECCI members have the option to address such disputes under this section. Disputes may be binding, governed by a legal contract, or non-binding, lacking a contractual basis. In either scenario, clients with ongoing disputes may submit their queries under this section. Chamber officers will then initiate the resolution process, aiding parties in reaching a resolution through arbitration or litigation.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.public_rounded,
                title: 'Publications',
                content:
                'All chamber publications are accessible in our digital library. Users can explore daily viewpoints, newsletters, and our annual magazine to stay updated on the latest trends.\n\nt is our primary goal to support the digitalization efforts of India, saving both time and money for our users.',
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
                  '${widget.content.substring(0, 200)}...', // Show first 200 characters
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