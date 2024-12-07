import 'package:flutter/material.dart';
import 'package:hostel_management/student/complaint.dart';
import 'package:hostel_management/student/complaint_status.dart';
import 'package:hostel_management/student/student_dashboard.dart';
import 'package:hostel_management/student/student_login.dart';
import 'package:hostel_management/student/student_room.dart';
import 'package:hostel_management/warden/announcements.dart';
import 'package:hostel_management/warden/complaint_box.dart';
import 'package:hostel_management/warden/room_management.dart';
import 'package:hostel_management/warden/visitor_management.dart';
import 'package:hostel_management/warden/warden_dashboard.dart';
import 'package:hostel_management/warden/warden_login.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();  // Initialize Firebase
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Boys Hostel Management',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => UserTypeSelectionScreen(),
        '/student-login': (context) => StudentLoginScreen(),
        '/warden-login': (context) => WardenLoginScreen(),
        '/student-dashboard': (context) => StudentDashboardScreen(),
        '/warden-dashboard': (context) => WardenDashboardScreen(),
        '/room-management': (context) => RoomManagementScreen(),
        '/complaint-box': (context) => ComplaintBoxScreen(),
        '/visitor-management': (context) => VisitorManagementScreen(),
        '/announcements': (context) => ViewAnnouncementsScreen(),

        // Student Routes
        '/room-details': (context) => RoomDetailsScreen(),
        '/view-announcements': (context) => ViewAnnouncementsScreen(),
        '/view-complaints-status': (context) => ViewComplaintsStatusScreen(),
        '/submit-complaints': (context) => SubmitComplaintScreen(),
      },
    );
  }
}

class UserTypeSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Boys Hostel Management')),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Are you a Warden or a Student?',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/warden-login');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Warden Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/student-login');
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  'Student Login',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
