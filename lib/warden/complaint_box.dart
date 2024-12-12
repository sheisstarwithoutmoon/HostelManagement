import 'package:flutter/material.dart';

class ComplaintBoxScreen extends StatelessWidget {
  final List<String> complaints = ['Water Leakage', 'Noise Complaint'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaints')),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(
                complaints[index],
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              trailing: ElevatedButton(
                onPressed: () {
                  // Mark as resolved
                },
                child: Text('Resolve'),
              ),
            ),
          );
        },
      ),
    );
  }
}
