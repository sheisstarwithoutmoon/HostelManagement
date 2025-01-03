import 'package:bhm/Models/student_model.dart';
import 'package:bhm/Models/user_model.dart';

class Warden extends User {
  final String hostelName;

  Warden({
    required String name,
    required String email,
    required String pass,
    required this.hostelName,
  }) : super(
            name: name,
            email: email,
            pass: pass,
            role: 'warden'); // Role is 'warden'
}

class HostelManager {
  final List<Student> allStudents;

  HostelManager({required this.allStudents});

  // Function to get all students by their hostel
  List<Student> getStudentsByHostel(String hostelName) {
    return allStudents
        .where((student) => student.hostel == hostelName)
        .toList();
  }
}
