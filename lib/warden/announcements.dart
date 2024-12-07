import 'package:flutter/material.dart';

class ViewAnnouncementsScreen extends StatelessWidget {
  final List<String> announcements = ['Maintenance on Sunday', 'Room Check Tomorrow'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Announcements')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: announcements.length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    title: Text(
                      announcements[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'New Announcement',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (value) {
                // Add new announcement
              },
            ),
          ),
        ],
      ),
    );
  }
}
