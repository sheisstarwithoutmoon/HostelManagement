import 'package:flutter/material.dart';

class StudentDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Student Dashboard')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          children: [
            _buildDashboardCard(
              context,
              icon: Icons.local_laundry_service, 
              title: 'Washing Machine Updates',
              onTap: () => Navigator.pushNamed(context, '/washing-machine-community'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.notification_important,
              title: 'View Announcements',
              onTap: () => Navigator.pushNamed(context, '/view-announcements'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.report_problem, 
              title: 'Complaints', 
              onTap: () => Navigator.pushNamed(context, '/complaints'), 
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDashboardCard(BuildContext context,
      {required IconData icon, required String title, required Function() onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 40, color: Theme.of(context).primaryColor),
              SizedBox(height: 10),
              Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
