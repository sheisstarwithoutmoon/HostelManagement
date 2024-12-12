import 'package:flutter/material.dart';

class WardenDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Warden Dashboard')),
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
              icon: Icons.meeting_room,
              title: 'Room Allotment',
              onTap: () => Navigator.pushNamed(context, '/room-management'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.report_problem,
              title: 'View Complaints',
              onTap: () => Navigator.pushNamed(context, '/complaint-box'),
            ),
            _buildDashboardCard(
              context,
              icon: Icons.announcement,
              title: 'Post Announcements',
              onTap: () => Navigator.pushNamed(context, '/announcements'),
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
