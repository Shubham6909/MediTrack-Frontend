import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

class VirtualB2BForumScreen extends StatefulWidget {
  @override
  _VirtualB2BForumScreenState createState() => _VirtualB2BForumScreenState();
}

class _VirtualB2BForumScreenState extends State<VirtualB2BForumScreen> {
  int _currentStep = 1;
  bool _isExpanded = false;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _designationController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  List<Map<String, String>> participants = [];

  String _currentSection = 'faqs'; // Track current section
  String? _expandedFaqId;
  String? _expandedBusinessFaqId;


  // FAQ Data
  final List<Map<String, String>> generalFaqs = [
    {
      'id': '1',
      'title': "What is AECCI's Virtual B2B Forum?",
      'content': "The Virtual B2B Forum is an online platform designed to connect Indian businesses and expert collaborators from around the world, facilitating meaningful business discussions and opportunities for both the sides."
    },
    {
      'id': '2',
      'title': "What is the mission of the AECCI B2B Forum?",
      'content': "To facilitate global business connections and promote international trade opportunities."
    },
    {
      'id': '3',
      'title': "What are the general trade queries and service requirements of B2B business participants?",
      'content': "Participants typically seek information about market access, regulatory compliance, and potential business partnerships."
    },
  ];

  // Business Opportunities FAQs
  final List<Map<String, String>> businessFaqs = [
    {
      'id': 'b1',
      'title': "How are the business participants selected for the platform?",
      'content': "Business participants in our B2B interactive meetings are primarily our registered trade members who seek our assistance with their business and shipment-related services. As part of the registration process, we collect their profile information and authentication documents. Based on this, we invite qualified members to participate in our B2B meetings, ensuring they are the right participants for the platform."
    },
    {
      'id': 'b2',
      'title': "How do you keep things discreet?",
      'content': "We understand the sensitivity of the information we handle and take every possible measure to maintain its confidentiality. Before onboarding any participant or collaborator, we follow a thorough process that includes discussion, application, reviewing their profile and relevant documents. Only after this due diligence and signing the agreement, we gain the confidence to bring them on board for B2B meets."
    },
    {
      'id': 'b3',
      'title': "How do you decide whether or not to approve a B2B meeting request?",
      'content': "Each meeting request is carefully reviewed to identify the seriousness of businesses so that to extend maximum benefit from the opportunities offered by the B2B forum. Uncomplete application or wrong information on B2B platform may lead to rejection of meeting request."
    },
    {
      'id': 'b4',
      'title': "Who is responsible for controlling the business meetings?",
      'content': "All business meetings facilitated through our B2B forum are managed and monitored by our B2B team. While we do not directly participate in the discussions between experts and business participants, team remains actively available throughout the meeting.B2B team keeps ready to provide any technical or other support needed to ensure the meeting runs smoothly and according to the given schedule."
    },
    {
      'id': 'b5',
      'title': "How do I getn update on the status of my B2B meeting ?",
      'content': "Our B2B platform is designed for the convenience of both parties. Expert collaborators can provide multiple available time slots directly on the platform, and Indian participants can request for appointments based on the available options.All details regarding your meeting schedule or other updates, will be available in your digital account on our platform."
    },
    {
      'id': 'b6',
      'title': "How much time is generally available for meeting and discussing business ?",
      'content': "Each meeting on our B2B Forum is allocated a 30-minute slot. Video conferencing windows are opened in advance for audio-video testing, and the remaining 30 minutes are dedicated to discussion. We encourage our collaborative partners to address as many queries as possible during this free introductory session, with the goal of building strong relationships and in order to secure potential future clients."
    },
    {
      'id': 'b7',
      'title': "How can I prepare  get the maximum outcome from the meeting?",
      'content': "We insist our business participants to share their profile and probable points of discussion in advance so that the collaborator expert can keep ready to handle the relevant queries. Additionally, exchanging business cards at the end of the meeting is a great way to establish future connections and strengthen ongoing business relationships."
    },
    {
      'id': 'b8',
      'title': "I couldn't find any appointment requests for my country n the B2B platform. What can I do about it?",
      'content': "If there are fewer or no B2B meeting requests for your country on the platform, we can increase visibility by advertising your profile.Additionally, we can schedule a webinar or an Ask Me Anything session with you, which will help us to introduce you to our trade members and generate future connections."
    },
    {
      'id': 'b9',
      'title': "What happens if the other side doesn't want to cooperate uring the meeting?",
      'content': "Although such situations are rare, if you come-across such a partner who is passive or showing disinterest, it may be due to a language barrier or technical issues on other side. In such cases, please send us your feedback. We will follow up with the client and, if necessary, will facilitate written communication (via email) between both parties to address any concerns"
    },
    {
      'id': 'b10',
      'title': "I've changed my mind and no longer wish to continue with the scheduled B2B meeting.Can I request to edit the schedule?",
      'content': "If the meeting has not yet been confirmed by the Indian participant, you can certainly make the changes according to your availability. However, if the meeting has already been confirmed, it may be little difficult to make changes. In that case, please inform us directly, and we will do our best to work with the Indian participant to reschedule the meeting."
    },
    {
      'id': 'b11',
      'title': "What happens if my B2B meeting didn't succeed?",
      'content': "While we make every effort to ensure successful meetings, there are times when outcomes may not meet expectations due to factors beyond our control. We recommend exchanging business cards with your meeting partner so you can explore further opportunities at a later time."
    },
  ];

  Widget _buildFAQSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FAQs for Collaborators',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        Divider(color: Colors.grey),
        const SizedBox(height: 10),
        Text(
          'General',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),

        SizedBox(height: 16),
        ...generalFaqs.map((faq) => _buildFAQItem(faq, 'general')).toList(),

        SizedBox(height: 10),
        Text(
          'Business Opportunities',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 16),
        ...businessFaqs.map((faq) => _buildFAQItem(faq, 'business')).toList(),
        SizedBox(height: 16),
        const Text(
          'Team Members',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2C3E50),
          ),
        ),
        const Divider(thickness: 1),
        _buildTeamSection(),
        const Divider(thickness: 1),


      ],
    );
  }

  Widget _buildTeamSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Meet the AECCI B2B Forum Team',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Color(0xFF2C3E50),
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Our team is dedicated to ensuring a seamless experience for all our members. Here a brief introduction to the key members:',
          style: TextStyle(fontSize: 16, height: 1.5),
        ),
        const SizedBox(height: 16),
        // Team Members List
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTeamMember('Project Lead:', 'Mrs. Swarn Dhiman, Executive Director-B2B'),
            _buildTeamMember('Technical Expert Team:', 'Mr. Swapnil Mahadik, Mr. Shubham, Mr. Mayur'),
            _buildTeamMember('Legal Team:', 'Adv. Rohini Das, Adv. Akshata Mulik'),
          ],
        ),
        const SizedBox(height: 16),
        const Text(
          'We are here to assist you with any queries or support you may need.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 16),
        // Contact Information
        Row(
          children: [
            const Text(
              'Email: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                'ed@aecci.org.in',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1748F8),

                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            const Text(
              'Phone/WhatsApp: ',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            InkWell(
              onTap: () {},
              child: const Text(
                '0091-8433720996',
                style: TextStyle(
                  fontSize: 16,
                  color: Color(0xFF1748F8),

                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF1748F8),
            padding: const EdgeInsets.symmetric(horizontal: 23, vertical: 8),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          child: const Text(
            'Register Now',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Text(
        'Note: Before proceeding with this form, please take a moment to carefully read the FAQs. Ensure that all relevant details are accurately filled in. Select your preferred time slots for the next three months so that business participants can request appointments accordingly. Meetings will be confirmed based on mutual convenience and availability.',
        style: TextStyle(
          color: Colors.red,
          fontSize: 16,
          height: 1.5,
        ),
      ),
    );
  }

  Widget _buildTeamMember(String title, String members) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(
              text: title + ' ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: members),
          ],
        ),
      ),
    );
  }




  Widget _buildFAQItem(Map<String, String> faq, String type) {
    final isExpanded = (type == 'general' ? _expandedFaqId : _expandedBusinessFaqId) == faq['id'];

    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 1),
          decoration: BoxDecoration(
            color: isExpanded ? Color(0xFFE3F2FD) : Colors.white,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {
                setState(() {
                  if (type == 'general') {
                    _expandedFaqId = isExpanded ? null : faq['id'];
                  } else {
                    _expandedBusinessFaqId = isExpanded ? null : faq['id'];
                  }
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        faq['title']!,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
                        ),
                      ),
                    ),
                    Icon(
                      isExpanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                      color: Colors.black54,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        if (isExpanded)
          Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            width: double.infinity,
            child: Text(
              faq['content']!,
              style: TextStyle(
                fontSize: 15,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
          ),
      ],
    );
  }

  void _addParticipant() {
    if (participants.length >= 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Maximum limit of 3 participants reached!'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 2),
        ),
      );
      return;
    }

    if (_formKey.currentState!.validate()) {
      setState(() {
        participants.add({
          'name': '${_firstNameController.text} ${_lastNameController.text}',
          'designation': _designationController.text,
          'phone': _phoneController.text,
        });

        // Clear the form
        _firstNameController.clear();
        _lastNameController.clear();
        _designationController.clear();
        _phoneController.clear();
      });
    }
  }

  void _removeParticipant(int index) {
    setState(() {
      participants.removeAt(index);
    });
  }

  void _goToNextStep() {
    setState(() {
      _currentStep++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'B2B Forum',
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

      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                width: double.infinity,
                height: 160,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.asset(
                    'assets/images/Summer.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'AECCI B2B Forum is designed to strengthen business connections between foreign trade experts and Indian businesses, thus helping both sides to expand their reach globally.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: 8),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  _isExpanded ? "Read Less" : "Read More",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1748F8),
                  ),
                ),
              ),
              if (_isExpanded) ...[
                SizedBox(height: 12),
                Text(
                  'The forum will provide a platform for businesses to connect with potential partners, investors, and customers from around the world.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(height: 16),
                Text(
                  'This platform aims to help businesses grow globally by providing them with access to a network of professionals, investors, and potential customers. It is an opportunity to build meaningful business relationships and expand market presence.',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.start,
                ),
              ],
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildNavButton('FAQs', isActive: _currentSection == 'faqs',
                        onPressed: () => setState(() => _currentSection = 'faqs')),
                    _buildNavButton('Registration', isActive: _currentSection == 'registration',
                        onPressed: () => setState(() => _currentSection = 'registration')),
                    _buildNavButton('Participate Countries', isActive: _currentSection == 'countries',
                        onPressed: () => setState(() => _currentSection = 'countries')),
                    _buildNavButton('Meetings', isActive: _currentSection == 'meetings',
                        onPressed: () => setState(() => _currentSection = 'meetings')),
                  ],
                ),
              ),
              SizedBox(height: 24),
              if (_currentSection == 'faqs')
                _buildFAQSection()
              else if (_currentSection == 'registration')
                Card(
                  elevation: 2,
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // Stepper Section
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(5, (index) {
                                return Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor: index < _currentStep
                                          ? Color(0xFF1748F8)
                                          : Colors.grey,
                                      child: Text(
                                        (index + 1).toString(),
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    if (index < 4)
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 5),
                                        height: 2,
                                        width: 30,
                                        color: index < _currentStep - 1
                                            ? Color(0xFF1748F8)
                                            : Colors.grey,
                                      ),
                                  ],
                                );
                              }),
                            ),
                          ),

                          SizedBox(height: 16),

                          // Representative Information Section
                          Text(
                            'Representative Information',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 5),
                          Text(
                            '*In this section, the Collaborator can enter the details of the representatives who will attend the B2B virtual meeting. You can add information for up to three representatives',
                            style: TextStyle(fontSize: 14, color: Colors.red),
                          ),
                          if (participants.length >= 3)
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 8),
                              child: Text(
                                'Maximum limit of 3 participants reached',
                                style: TextStyle(
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          SizedBox(height: 16),
                          Row(
                            children: [
                              Expanded(
                                child: _buildLabeledTextField2('First Name*', 'firstName', _firstNameController),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: _buildLabeledTextField2('Last Name*', 'lastName', _lastNameController),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          _buildLabeledTextField2('Designation*', 'designation', _designationController),
                          SizedBox(height: 8),
                          _buildLabeledTextField2('Office Number/Mobile Number/WhatsApp*', 'phone', _phoneController),
                          SizedBox(height: 16),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: participants.length >= 3 ? null : _addParticipant,
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFF1748F8),
                                disabledBackgroundColor: Colors.grey,
                                padding: EdgeInsets.symmetric(vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              ),
                              child: Text(
                                'Add Representative',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          if (participants.isNotEmpty) ...[
                            SizedBox(height: 24),
                            Text(
                              'Added Participants:',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            ...participants.asMap().entries.map((entry) {
                              final index = entry.key;
                              final participant = entry.value;
                              return Container(
                                margin: EdgeInsets.only(bottom: 8),
                                padding: EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey.shade300),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '${participant['name']} - ${participant['designation']}',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 4),
                                          Text(
                                            '(${participant['phone']})',
                                            style: TextStyle(
                                              color: Colors.grey[600],
                                              fontSize: 13,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    IconButton(
                                      icon: Icon(Icons.remove_circle, color: Colors.red),
                                      onPressed: () => _removeParticipant(index),
                                    ),
                                  ],
                                ),
                              );
                            }).toList(),
                            SizedBox(height: 16),
                            // Navigation buttons
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  onPressed: () {

                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF1748F8),
                                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Back',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: participants.isNotEmpty
                                      ? () {

                                  }
                                      : null,
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFF1748F8),
                                    disabledBackgroundColor: Colors.grey,
                                    padding: EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Next',
                                    style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  ),
                )
              else if (_currentSection == 'countries')
                  _buildParticipatingCountries()
                else if (_currentSection == 'meetings')
                    _buildParticipatingCountries1()  // Changed from _buildParticipatingCountries
                  else
                    const SizedBox.shrink(),  // Default empty widget if no section matches
              _buildNoteSection(),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildParticipatingCountries() {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  height: 1.5,
                ),

              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildParticipatingCountries1() {
    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              text: TextSpan(
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.red,
                  height: 1.5,
                ),

              ),
            ),
            Text('Meetings',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
            const Divider(color: Colors.grey),
            SizedBox(height: 10),
            Text('No meetings found'),
          ],
        ),
      ),
    );
  }

  Widget _buildNavButton(String label, {bool isActive = false, required VoidCallback onPressed}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isActive ? Color(0xFF1748F8) : Colors.white,
          foregroundColor: isActive ? Colors.white : Color(0xFF1748F8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        ),
        onPressed: onPressed,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.3,
          ),
        ),
      ),
    );
  }
  Widget _buildLabeledTextField2(String label, String fieldName, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
        const SizedBox(height: 4),
        Container(
          height: 40,
          child: TextFormField(
            controller: controller,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey[200],
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 12.0,
              ),
              isDense: true,
            ),
            style: const TextStyle(fontSize: 14),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '$label is required';
              }
              if (fieldName == 'phone') {
                if (value.length < 10) {
                  return 'Phone number must be at least 10 digits';
                }
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}