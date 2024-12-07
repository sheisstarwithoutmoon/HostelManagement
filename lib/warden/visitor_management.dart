import 'package:flutter/material.dart';

class VisitorManagementScreen extends StatelessWidget {
  final List<String> visitors = ['John Doe', 'Jane Smith'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Visitor Management')),
      body: ListView.builder(
        itemCount: visitors.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              title: Text(visitors[index]),
              subtitle: Text('Purpose: Visit Student'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.check, color: Colors.green),
                    onPressed: () {
                      // Approve logic
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      // Reject logic
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
