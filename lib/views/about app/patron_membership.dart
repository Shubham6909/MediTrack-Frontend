import 'package:flutter/material.dart';

class PatronMembership extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'About PATRON MEMBERSHIP',
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
                icon: Icons.card_membership_rounded,
                title: 'What is Patron Membership?',
                content:
                '“Patron Membership is an elite tier within AECCI designed for companies seeking extensive support,'
                    'enhanced visibility, and exclusive opportunities in global trade. This membership provides unparalleled'
                    'benefits such as priority access to AECCI events, strategic insights, and bespoke services aimed at'
                    'fostering significant business growth and international expansion”',
                isExpandable: true, // No need for show more/less
              ),
              InfoCard(
                icon: Icons.card_membership_sharp,
                title: 'Eligibility for Patron Membership',
                content:
                '1.Large corporations with extensive export activities.\n'
                    '2.SMEs looking to expand their global footprint.\n'
                    '3.Companies seeking strategic networking and policy advocacy.\n'
                    '4.Businesses interested in leveraging advanced technologies and global partnerships.\n\n'
                    'By becoming a Patron Member, companies gain a competitive edge through AECCI’s vast resources and network, ensuring sustained growth and success in the international market.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.grid_goldenratio_sharp,
                title: 'PATRON MEMBERSHIP (SLIVER TIER)\nFEES- 3,50,000/- ',
                content:
                'Companies with an annual turnover upto 200 crores are eligible for the Silver Tier Patron Membership. This membership level offers essential support and benefits tailored for mid-sized businesses aiming to expand their global reach. In addition to the benefits listed under Corporate+ Membership, Silver Patron Members will enjoy the following exclusive advantages',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.diamond,
                title: 'PATRON MEMBERSHIP (BRONZE TIER)\nFEES- 7,00,000/-  ',
                content:
                'The Bronze Tier is designed for companies with an annual turnover between INR 200 crores and INR 800 crores. This tier provides enhanced benefits and opportunities, supporting larger companies in their efforts to grow and succeed in international markets. Building on the robust benefits of the Silver tier, the Bronze Patron Membership offers additional, highly attractive advantages. Designed for businesses seeking deeper engagement and enhanced support, the Bronze tier provides:',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.diamond_rounded,
                title: 'PATRON MEMBERSHIP (GOLD TIER)\nFEES- 10,00,000/- ',
                content:
                'Experience the Pinnacle of AECCI Support with Gold Patron Membership\nFor companies with an annual turnover exceeding INR 800 crores, the Gold Tier offers the most comprehensive benefits. As a Gold Patron Member, you’ll enjoy all the benefits of the silver and bronze tiers, along with exclusive, high-value perks that ensure your business stands out on the global stage.',
                isExpandable: true,
              ),
              InfoCard(
                icon: Icons.email,
                title: 'Contact Us',
                content: '📧 Email:membership@aecci.org.in\n📞 Board lines: +91-22-412 711 45 | 46\n📞 Mr. Harish Shetty',
                isExpandable: false, // Contact info should always be fully visible
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
