import 'package:flutter/material.dart';

class SubmitComplaintScreen extends StatefulWidget {
  @override
  _SubmitComplaintScreenState createState() => _SubmitComplaintScreenState();
}

class _SubmitComplaintScreenState extends State<SubmitComplaintScreen> {
  final TextEditingController complaintController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Submit a Complaint')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Card(
          elevation: 8,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: complaintController,
                  decoration: InputDecoration(
                    labelText: 'Complaint Details',
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 5,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Submit the complaint logic
                  },
                  child: Text('Submit Complaint'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
