import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About Rules and Policies ',
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
                icon: Icons.home_max_rounded,
                title: 'INTRODUCTION',
                content:
                '1.1 To frame, amend such Arbitration Rules to hereby govern the conduct of Arbitration Proceeding held at AECCI- International Arbitration Centre, India relating to International Commercial Arbitration and International Maritime Arbitration and for matters connected therewith or incidental thereto.\n1.2 By consenting to use the above Arbitration Rules to hereby govern the arbitration proceedings, to be conducted at the AECCI- IAC, Navi Mumbai, India the parties hereby further agree, acknowledge, and accept these rules or any revised rules framed thereafter approved by Council AECCI- IAC Navi Mumbai, India. And in the event of any dispute arising between a relevant rule and an express provision of applicable law hereby governing the Conduct of Arbitration Proceedings between the Parties to Arbitration, then the express provision of applicable/ governing law shall prevail over said relevant rule.\n1.3 The Arbitration Rules shall hereby deem to commence from such date as unanimously agreed upon by the Council AECCI- IAC.\n1.4 These Arbitration Rules shall govern any and all arbitration proceedings initiated on or after April, 2023, unless otherwise agreed upon by the Council AECCI- IAC, India to fix different of commencement of said Rules.”',
                isExpandable: true, // No need for show more/less
              ),
              InfoCard(
                icon: Icons.app_registration_sharp,
                title: ' ARBITRATION INVOCATION: INITIATING THE PROCESS',
                content:
                '4.1. Arbitration Agreement-\nIn this Part, “arbitration agreement” means an agreement by the parties to submit to arbitration all or certain disputes which have arisen or which may arise between them in respect of a defined legal relationship, whether contractual or not.\nAn arbitration agreement may be in the form of an arbitration clause in a contract or in the form of a separate agreement.\n'
                    'a. An arbitration agreement shall be in writing.\nb.'
                    'An arbitration agreement is in writing if it is contained in—(i) a document signed by the parties;(ii) an exchange of letters, '
                    'telex, telegrams or other means of telecommunication [including communication through electronic means] which provide a record of the agreement; or\nc. The reference in a contract to a document containing an arbitration clause constitutes an arbitration agreement if the contract is in writing and the reference is such as to make that arbitration clause part of the contract.\n4.2. Invocation of Arbitration Proceedings –\na. Any participant seeking to initiate arbitration (“Claimant”) must first send a written request for Arbitration to the registrar/council.\nb. The date on which the Request is received by the Council shall, for all purposes, be deemed to be the date of the commencement of the arbitration.\nc. The council will notify all involved parties of the arbitration’s scheduled commencement date.\nd. The Request for arbitration shall contain a) the name in full, description, address and other contact details of each of the parties; b) the name in full, address and other contact details of any person(s) representing the claimant in the arbitration; c) a description of the nature and circumstances of the dispute giving rise to the claims.\ne. The Request for Arbitration should also include the Statement of Claim of the Claimant.\nf. Within 14 days of getting the claimant’s request for arbitration, Defendant must submit his reply to the Claimant. Confirmation or denial of the claims, contact information, a description of the conflict and defense, nomination of a judge, service of copies of the answer and documents on all parties, and evidence of payment, of the filing fee for any complaint are all required in the response. Include a statement of defense, and a statement of counterclaim in your answer, and feel free to revise it as needed within the parameters of the adjudication agreement.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.celebration,
                title: 'THE ARBITRAL TRIBUNAL',
                content:
                '6.1 Appointment of Arbitrators-\na. A person of any nationality, location and language may be an arbitrator, unless otherwise agreed by the parties.\nb. The parties are free to agree on a procedure for appointing the arbitrator or arbitrators.\nc. Failing any agreement referred to in sub-clause b, or unless it appears to the Council of AECCI-IAC, giving due regard to any proposals by the parties, the complications, the proportion connected with or the relevant circumstances of the dispute that the dispute warrants the appointment of three arbitrators, a sole-arbitrator shall be appointed.\nIn appointing an arbitrator under these Rules, the Council at AECCI-IAC shall have due consideration and appraisal to the nature of the transaction, the nature, substance and circumstances of the dispute, the nationality, location and languages of the parties and (if more than two) the number of parties. Due consideration will further be given to any qualifications required by the arbitrator for the subject matter pertaining to the dispute at hand. The Council at AECCI-IAC shall also consider whether the arbitrator has sufficient time, availability and ability to conduct the case in an instantaneous and coherent manner appropriate for arbitration.\n6.2 Sole Arbitrator-\nIn the event that a sole arbitrator needs to be appointed, either party holds the right to propose one or more individuals to the other party. From these proposed names, one will be selected to act as the sole arbitrator. Should the parties be unable to reach an agreement on this matter, the Council of AECCI-IAC, India, will step in to constitute the Arbitral Tribunal, appointing a sole arbitrator.\nIn situations where the parties are unable to mutually elect an arbitrator, the Council will assume responsibility for selecting a sole arbitrator within a maximum period of 7 days. The entire process of arbitrator selection will be completed within a total timeframe not exceeding 15 days.',
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
