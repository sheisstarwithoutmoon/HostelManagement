import 'package:flutter/material.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;

types.User? currentUser;  // Global variable to store the logged-in user

class WashingMachineUpdatesScreen extends StatefulWidget {
  @override
  _WashingMachineUpdatesScreenState createState() =>
      _WashingMachineUpdatesScreenState();
}

class _WashingMachineUpdatesScreenState
    extends State<WashingMachineUpdatesScreen> {
  final List<types.Message> _messages = [];
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Initialize currentUser with the logged-in student's details.
    // You can replace the hardcoded email with actual login data (e.g., FirebaseAuth or another source)
    if (currentUser == null) {
      currentUser = types.User(id: 'studentEmail@example.com');  // Example: Replace with actual user data.
    }
  }

  // Method to send messages
  /*void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      final newMessage = types.TextMessage(
        author: currentUser!, // Use the current user
        createdAt: DateTime.now().millisecondsSinceEpoch,
        text: _controller.text,
      );
      setState(() {
        _messages.add(newMessage);
      });
      _controller.clear();
    }
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Washing Machine Updates'),
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
            child: Chat(
              messages: _messages,
              onSendPressed: (types.PartialText message) {
                //_sendMessage();
              },
              user: currentUser!,  // Use the current user instance here
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: (){},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
