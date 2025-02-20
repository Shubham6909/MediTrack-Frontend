import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Meetings extends StatefulWidget {
  final Map<String, dynamic>? loginData;
  final String token;

  const Meetings({
    Key? key,
    this.loginData,
    required this.token,
  }) : super(key: key);

  @override
  _MeetingsState createState() => _MeetingsState();
}

class _MeetingsState extends State<Meetings> {
  List<Map<String, dynamic>> meetings = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchMeetingDetails();
  }

  Future<void> fetchMeetingDetails() async {
    setState(() => isLoading = true);

    final userId = widget.loginData?['userId'] ?? widget.loginData?['info']?['_id']?.toString();
    final token = widget.loginData?['token'] ?? widget.loginData?['data']?['token'];

    if (userId == null || token == null) {
      _showMessage('Error: Missing authentication details');
      setState(() => isLoading = false);
      return;
    }


    // final url = 'https://e-platapi.aecci.org.in/api/v2/b2b/getUserBookedSlots/$userId';
    final url = 'http://localhost:3001/api/v2/b2b/getUserBookedSlots/$userId';

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': 'Bearer $token', 'Content-Type': 'application/json'},
      );

      if (!mounted) return;

      if (response.statusCode == 200) {
        final data = json.decode(response.body)['data'];
        setState(() {
          meetings = List<Map<String, dynamic>>.from(data['bookedSlots'] ?? []);
        });
      } else {
        _showMessage('Error: ${json.decode(response.body)['message'] ?? 'Failed to fetch details'}');
      }
    } catch (e) {
      _showMessage('Failed to fetch data. Please try again.');
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  void _showMessage(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meetings Overview', style: TextStyle(color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.blue),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : meetings.isEmpty
          ? const Center(child: Text('No meetings available'))
          : ListView.builder(
        itemCount: meetings.length,
        itemBuilder: (context, index) {
          final meeting = meetings[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(meeting['title'] ?? 'Meeting'),
              subtitle: Text('Date: ${meeting['date'] ?? 'N/A'}'),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
            ),
          );
        },
      ),
    );
  }
}
