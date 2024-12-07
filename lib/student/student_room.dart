import 'package:flutter/material.dart';

class RoomDetailsScreen extends StatelessWidget {
  final String roomNumber = 'Room 101';
  final String status = 'Vacant';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('My Room')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Room Number: $roomNumber',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Text('Room Status: $status'),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Room allocation logic if applicable
                  },
                  child: Text('Allocate Room'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
