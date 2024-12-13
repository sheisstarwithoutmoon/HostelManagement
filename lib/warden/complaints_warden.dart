import 'package:bhm/data/complaint_data.dart';
import 'package:flutter/material.dart';
import 'package:bhm/widget/complaint_model.dart';

class ComplaintBoxScreen extends StatefulWidget {
  @override
  _ComplaintBoxScreenState createState() => _ComplaintBoxScreenState();
}

class _ComplaintBoxScreenState extends State<ComplaintBoxScreen> {
  List<Complaint> complaints = ComplaintData.complaints;

  void markComplaintAsResolved(int index) {
    setState(() {
      complaints[index].updateStatus('Resolved');
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Complaint marked as Resolved')),
    );
  }

  void markComplaintAsPending(int index) {
    setState(() {
      complaints[index].updateStatus('Pending'); // Change the status to 'Pending'
    });
    // Show confirmation message for marking as Pending
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Complaint marked as Pending')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Complaint Management'),
        backgroundColor: Color.fromARGB(255, 138, 106, 158),
      ),
      body: SingleChildScrollView( 
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            ListView.builder(
              shrinkWrap: true,  
              itemCount: complaints.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(15),
                    title: Text(
                      complaints[index].title,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          complaints[index].description,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Hostel: ${complaints[index].hostel}',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Posted on: ${complaints[index].date}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Status: ${complaints[index].status}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    trailing: complaints[index].status == 'Pending'
                        ? ElevatedButton(
                            onPressed: () {
                              markComplaintAsResolved(index); // Change status to 'Resolved'
                            },
                            child: Text('Mark as Resolved'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, // Green for "Resolved"
                              foregroundColor: Colors.white,
                            ),
                          )
                        : complaints[index].status == 'Resolved'
                            ? null 
                            : null,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
