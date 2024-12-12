import 'package:flutter/material.dart';
import 'package:bhm/warden/room_deets.dart';
import 'package:bhm/widget/student.dart';

// Import the global students list
import 'package:bhm/data/student_data.dart';  // This file holds the students list

class RoomManagementScreen extends StatelessWidget {
  final TextEditingController rollNumberController = TextEditingController();
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Room Management')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // TextField to enter Roll Number
            TextField(
              controller: rollNumberController,
              decoration: InputDecoration(
                labelText: 'Enter Roll Number',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.text,
            ),
            SizedBox(height: 16.0),
            
            // TextField to enter Name
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: 'Enter Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            
            // Submit Button to search the student
            ElevatedButton(
              onPressed: () {
                String rollNumber = rollNumberController.text.trim();
                String name = nameController.text.trim();

                // Use firstWhere and handle case where student is not found
                try {
                  // Look for student by roll number and name
                  Student foundStudent = students.firstWhere(
                    (student) => student.roll_no == rollNumber && student.name == name,
                  );

                  // Navigate to StudentRoomDetailsScreen if student is found
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => StudentRoomDetailsScreen(
                        room: foundStudent.room_no,
                        hostel: foundStudent.hostel,
                      ),
                    ),
                  );
                } catch (e) {
                  // Show error if student not found
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Student not found or incorrect details!')),
                  );
                }
              },
              child: Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
