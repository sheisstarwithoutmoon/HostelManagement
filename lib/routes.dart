import 'package:bhm/student/student_complaint.dart';
import 'package:bhm/student/student_dashboard.dart';
import 'package:bhm/student/student_login.dart';
import 'package:bhm/student/view_announcement.dart';
import 'package:bhm/student/washing_machine.dart';
import 'package:bhm/user.dart';
import 'package:bhm/warden/post_annoucement.dart';
import 'package:bhm/warden/complaints_warden.dart';
import 'package:bhm/warden/room_allocation.dart';
import 'package:bhm/warden/warden_dashboard.dart';
import 'package:bhm/warden/warden_login.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => UserTypeSelectionScreen(),
  '/warden-login': (context) => WardenLoginScreen(),
  '/warden-dashboard': (context) => WardenDashboardScreen(),
  '/room-management': (context) => RoomManagementScreen(),
  '/complaint-box': (context) => ComplaintBoxScreen(),
  '/announcements': (context) => PostAnnouncementsScreen(),

  // Student Routes
  '/student-login': (context) => StudentLoginScreen(),
  '/student-dashboard': (context) => StudentDashboardScreen(),
  '/washing-machine-community': (context) => WashingMachineUpdatesScreen(),
  '/view-announcements': (context) => ViewAnnouncementsScreen(),
  '/complaints': (context) => PostComplaintScreen(),
  /*'/submit-complaints': (context) => SubmitComplaintScreen(),*/
};

