import 'package:flutter/material.dart';

class PostAnnouncementsScreen extends StatefulWidget {
  @override
  _PostAnnouncementsScreenState createState() => _PostAnnouncementsScreenState();
}

class _PostAnnouncementsScreenState extends State<PostAnnouncementsScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController contentController = TextEditingController();

  // List of hostels to select from
  final List<String> hostels = ['BH-1', 'BH-2', 'BH-3', 'BH-4'];

  String selectedHostel = 'BH-1'; // Default selection

  // List to store announcements
  List<Map<String, String>> announcements = [];

  // Method to post the announcement
  void postAnnouncement() {
    String title = titleController.text.trim();
    String content = contentController.text.trim();

    if (title.isNotEmpty && content.isNotEmpty) {
      setState(() {
        // Add the new announcement to the list
        announcements.add({
          'hostel': selectedHostel,
          'title': title,
          'content': content,
          'date': DateTime.now().toString(),
        });
      });

      // Clear the text fields after posting
      titleController.clear();
      contentController.clear();

      // Show confirmation message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Announcement posted successfully for $selectedHostel!')),
      );
    } else {
      // Show error message if title or content is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in both title and content!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Announcement'),
      ),
      resizeToAvoidBottomInset: true, // Ensures UI adjusts when keyboard appears
      body: SingleChildScrollView( // Allows scrolling when the keyboard appears
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

            // Title input field
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Announcement Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),

            // Content input field
            TextField(
              controller: contentController,
              decoration: InputDecoration(
                labelText: 'Announcement Content',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
            ),
            SizedBox(height: 20),

            // Button to post announcement
            ElevatedButton(
              onPressed: postAnnouncement,
              child: Text('Post Announcement'),
              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),

            // Display posted announcements
            ListView.builder(
              shrinkWrap: true,  // Allows the list to be scrollable without taking too much space
              itemCount: announcements.length,
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
                      announcements[index]['title']!,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 10),
                        Text(
                          announcements[index]['content']!,
                          style: TextStyle(fontSize: 14, color: Colors.black87),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'Hostel: ${announcements[index]['hostel']}',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          'Posted on: ${announcements[index]['date']}',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
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
