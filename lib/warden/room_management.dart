import 'package:flutter/material.dart';

class RoomManagementScreen extends StatelessWidget {
  final List<String> rooms = ['Room 101', 'Room 102', 'Room 103'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Room Management')),
      body: ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ListTile(
              title: Text(
                rooms[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Status: Vacant'),
              trailing: ElevatedButton(
                onPressed: () {
                  // Handle allocation logic
                },
                child: Text('Allocate'),
              ),
            ),
          );
        },
      ),
    );
  }
}
