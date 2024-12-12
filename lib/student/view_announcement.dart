import 'package:flutter/material.dart';

class ViewAnnouncementsScreen extends StatefulWidget {
  @override
  _ViewAnnouncementsScreenState createState() =>
      _ViewAnnouncementsScreenState();
}

class _ViewAnnouncementsScreenState extends State<ViewAnnouncementsScreen> {
  // List of announcements to display for students
  List<Map<String, String>> announcements = [
    {
      'hostel': 'BH-1',
      'title': 'Washing Machine Maintenance',
      'content': 'The washing machines will be under maintenance from 10 AM to 1 PM tomorrow.',
      'date': '2024-12-12 09:00',
    },
    {
      'hostel': 'BH-2',
      'title': 'Washroom Renovation',
      'content': 'First four Washrooms will be closed for renovation starting next week. Please make alternative arrangements.',
      'date': '2024-12-11 10:00',
    },
    // Add more sample announcements here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Announcements from Warden'),
        backgroundColor: Color.fromARGB(255, 138, 106, 158),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: announcements.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 4,
              margin: EdgeInsets.symmetric(vertical: 10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(15),
                title: Text(
                  announcements[index]['title']!,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10),
                    Text(
                      announcements[index]['content']!,
                      style: TextStyle(fontSize: 14, color: Colors.black87),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Hostel: ${announcements[index]['hostel']}',
                      style: TextStyle(fontSize: 12),
                    ),
                    Text(
                      'Posted on: ${announcements[index]['date']}',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
