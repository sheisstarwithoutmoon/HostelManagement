class Complaint {
  String title;
  String description;
  String status;
  String date;
  String hostel;

  Complaint({
    required this.title,
    required this.description,
    required this.status,
    required this.date,
    required this.hostel,
  });

  void updateStatus(String newStatus) {
    status = newStatus;
  }

  // CopyWith method
  Complaint copyWith({
    String? title,
    String? description,
    String? status,
    String? date,
    String? hostel,
  }) {
    return Complaint(
      title: title ?? this.title,
      description: description ?? this.description,
      status: status ?? this.status,
      date: date ?? this.date,
      hostel: hostel ?? this.hostel,
    );
  }
  
}

