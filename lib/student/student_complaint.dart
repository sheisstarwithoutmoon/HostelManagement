import 'package:flutter/material.dart';

class PostComplaintScreen extends StatefulWidget {
  @override
  _PostComplaintScreenState createState() => _PostComplaintScreenState();
}

class _PostComplaintScreenState extends State<PostComplaintScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  final List<String> hostels = ['BH-1', 'BH-2', 'BH-3', 'BH-4'];

  String selectedHostel = 'BH-1'; // Default 

  List<Map<String, String>> complaints = [];

  String role = 'student';

  void postComplaint() {
    String title = titleController.text.trim();
    String content = contentController.text.trim();

    if (title.isNotEmpty && content.isNotEmpty) {
      setState(() {
        complaints.add({
          'hostel': selectedHostel,
          'title': title,
          'content': content,
          'date': DateTime.now().toString(),
          'status': 'Pending', // Set initial status to 'Pending'
        });
      });

      titleController.clear();
      contentController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Complaint posted successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in both title and content!')),
      );
    }
  }

  
  void changeComplaintStatus(int index) {
    setState(() {
    
      complaints[index]['status'] = 'Resolved';
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Complaint marked as Resolved')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Complaint'),
        backgroundColor: Color.fromARGB(255, 138, 106, 158), 
      ),
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView( // Allows scrolling 
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Hostel selection dropdown
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1),
              ),
              child: DropdownButton<String>(
                value: selectedHostel,
                onChanged: (String? newHostel) {
                  setState(() {
                    selectedHostel = newHostel!;
                  });
                },
                isExpanded: true,
                items: hostels.map<DropdownMenuItem<String>>((String hostel) {
                  return DropdownMenuItem<String>(
                    value: hostel,
                    child: Text(hostel),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),

            
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Complaint Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

           
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Complaint Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),

            
            ElevatedButton(
              onPressed: postComplaint,
              child: Text('Post Complaint'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),

           
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
                      complaints[index]['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          complaints[index]['content']!,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Hostel: ${complaints[index]['hostel']}',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Posted on: ${complaints[index]['date']}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Status: ${complaints[index]['status']}',
                          style: TextStyle(fontSize: 12, color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    trailing: role == 'warden' && complaints[index]['status'] == 'Pending'
                        ? ElevatedButton(
                            onPressed: () {
                              changeComplaintStatus(index); 
                            },
                            child: Text('Resolved'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green, 
                              foregroundColor: Colors.white,  
                            ),
                          )
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
