import 'package:flutter/material.dart';

class StudentRoomDetailsScreen extends StatelessWidget {
  final String room;
  final String hostel;

  StudentRoomDetailsScreen({required this.room, required this.hostel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Room Details')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Room Details',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20.0),
            Text(
              'Room: $room',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10.0),
            Text(
              'Hostel: $hostel',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Go Back'),
            ),
          ],
        ),
      ),
    );
  }
}
