import 'package:bhm/widget/user_model.dart';

class Student extends User {
  final String hostel;
  final String room_no; // e.g., A-109
  final String roll_no; // Add roll number

  Student({
    required String name,
    required String email,
    required String pass,
    required this.hostel,
    required this.room_no,
    required this.roll_no, // Pass roll number to the constructor
  }) : super(name: name, email: email, pass: pass, role: 'student');
}
