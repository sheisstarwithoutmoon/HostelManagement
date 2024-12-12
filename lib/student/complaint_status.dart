import 'package:flutter/material.dart';

class ViewComplaintsStatusScreen extends StatelessWidget {
  final List<Map<String, String>> complaints = [
    {'complaint': 'Water Leakage', 'status': 'Resolved'},
    {'complaint': 'Noise Complaint', 'status': 'Pending'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Complaints Status')),
      body: ListView.builder(
        itemCount: complaints.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text('${complaints[index]['complaint']}'),
              subtitle: Text('Status: ${complaints[index]['status']}'),
            ),
          );
        },
      ),
    );
  }
}
