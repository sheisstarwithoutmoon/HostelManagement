import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  _ForgotPasswordScreenState createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Forgot Password"),
        automaticallyImplyLeading: false,
      ),
      body: WillPopScope(
        onWillPop: () async {
          return false;
        },
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                controller: _controller,
                decoration: InputDecoration(
                  labelText: 'Enter your email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: (){/*method to send reset link*/},
                child: Text("Send Reset Link"),
              ),
              TextButton(
                  onPressed: () {
                    // Navigate back to the login screen
                    Navigator.pop(context);
                  },
                  child: const Text("Back to Login"),
              ),
              ],
            ),
        ),
      ),
      );
  }
}
