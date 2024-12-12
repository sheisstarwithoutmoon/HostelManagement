import 'package:bhm/widget/complaint_model.dart';

class ComplaintData {
  static final List<Complaint> complaints = [
    Complaint(
      title: 'Water leakage in Room 102',
      description: 'The tap in the bathroom is leaking continuously.',
      status: 'Pending',
      date: '2024-12-10',
      hostel: 'A',
    ),
    Complaint(
      title: 'Broken Window in Common Area',
      description: 'A window in the common area is broken and needs fixing.',
      status: 'Resolved',
      date: '2024-12-08',
      hostel: 'B',
    ),
    Complaint(
      title: 'Internet Issues',
      description: 'Wi-Fi is not working on the 2nd floor.',
      status: 'Pending',
      date: '2024-12-11',
      hostel: 'C',
    ),
  ];
}
