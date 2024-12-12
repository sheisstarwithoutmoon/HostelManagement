import 'package:flutter/material.dart';

class AnnouncementsScreen extends StatelessWidget {
  final List<String> announcements = ['Maintenance on Sunday', 'Room Check Tomorrow'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Announcements')),
      body: ListView.builder(
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
    );
  }
}
