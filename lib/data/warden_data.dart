import 'package:bhm/Models/warden_model.dart';

// Warden data for BH-1
Warden mahesh = Warden(
  name: 'Mahesh Kumar',
  email: 'mahesh.kumar@gmail.com',
  pass: "123456",
  hostelName: 'BH-1',
);

// Warden data for BH-2
Warden gopi = Warden(
  name: 'Gopi Reddy',
  email: 'gopi.reddy@gmail.com',
  pass: "123456",
  hostelName: 'BH-2',
);

// Warden data for BH-3
Warden rajesh = Warden(
  name: 'Rajesh Singh',
  email: 'rajesh.singh@gmail.com',
  pass: "123456",
  hostelName: 'BH-3',
);

// Warden data for BH-4
Warden vikram = Warden(
  name: 'Vikram Patel',
  email: 'vikram.patel@gmail.com',
  pass: "123456",
  hostelName: 'BH-4',
);

// List of Wardens
List<Warden> wardens = [mahesh, gopi, rajesh, vikram];
