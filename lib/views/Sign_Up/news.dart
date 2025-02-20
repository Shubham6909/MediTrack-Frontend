import 'package:flutter/material.dart';

import '../about app/message.dart';

class ScrollingNewsText extends StatefulWidget {
  final TextStyle? textStyle;
  final double speed;

  ScrollingNewsText({
    this.textStyle,
    this.speed = 130.0,
  });

  @override
  _ScrollingNewsTextState createState() => _ScrollingNewsTextState();
}

class _ScrollingNewsTextState extends State<ScrollingNewsText>
    with SingleTickerProviderStateMixin {
  late ScrollController _scrollController;
  late AnimationController _animationController;
  late double _maxScrollExtent;
  final GlobalKey _contentKey = GlobalKey();

  final List<String> newsItems = [
    "Procedure for implementation of Import Management System for import of restricted IT Hardware (viz. Laptops, Tablets, All-in-one Personal Computers, Ultra small form factor computers and Servers under HSN 8471) for the calendar year 2025",
    "Budget will be focused on several reforms across 6 domains: taxation, power sector, urban development, mining, and financial sector & regulatory reforms.",
    "Government to launch new scheme for women from SC & ST, first-time entrepreneurs. The scheme will provide term loans up to Rs 2 Cr during the next 5 years",
    "The Marine sector: Govt to bring in schemes for fisheries with a focus on the Andaman & Nicobar . Seafood exports valued at Rs60,000 Crores.",
    "The credit Guarantee increased to 10 lakhs for MSMEs",
  ];

  int currentNewsIndex = 0;
  bool isTransitioning = false;

  String get currentNews => newsItems[currentNewsIndex];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  void _startScrolling() {
    if (!mounted) return;

    final RenderBox renderBox =
    _contentKey.currentContext?.findRenderObject() as RenderBox;
    _maxScrollExtent = renderBox.size.width;

    final duration =
    Duration(milliseconds: (_maxScrollExtent / widget.speed * 1000).round());

    _animationController.duration = duration;

    Animation<double> _animation = Tween<double>(
      begin: 0.0,
      end: _maxScrollExtent,
    ).animate(_animationController);

    _animation.addListener(() {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_animation.value);
      }
    });

    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed && !isTransitioning) {
        isTransitioning = true;
        _scrollController.jumpTo(0.0);
        _animationController.reset();

        setState(() {
          currentNewsIndex = (currentNewsIndex + 1) % newsItems.length;
        });

        // Immediately start the next animation
        Future.microtask(() {
          if (mounted) {
            isTransitioning = false;
            _startScrolling();
          }
        });
      }
    });

    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.shade300),
          bottom: BorderSide(color: Colors.grey.shade300),
        ),
      ),
      child: Row(
        children: [
          // Notifications Label with Icon
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(1),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 2,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Row(
              children: [
                Icon(
                  Icons.notifications,
                  color: Colors.green.shade800,
                  size: 20,
                ),

              ],
            ),
          ),
          SizedBox(width: 10),
          // Space between "Notifications" and scrolling text

          // Scrolling Text
          Expanded(
            child: SingleChildScrollView(
              controller: _scrollController,
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: GestureDetector(
                onTap: () {
                  // Pass the selected news item to MessageScreen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MessageScreen(
                        // Passing the selected news
                      ),
                    ),
                  );
                },
                child: Container(
                  key: _contentKey,
                  padding: EdgeInsets.symmetric(horizontal: MediaQuery
                      .of(context)
                      .size
                      .width),
                  child: Row(
                    children: [
                      Text(
                        currentNews,
                        style: widget.textStyle ??
                            TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}