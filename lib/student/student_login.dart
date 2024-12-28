import 'package:bhm/data/student_data.dart';
import 'package:bhm/forgot_pass_screen.dart';
import 'package:bhm/student/student_signup.dart';
import 'package:flutter/material.dart';

class StudentLoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Card(
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Student Login',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 20),
                  // Email input field
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 15),
                  // Password input field
                  TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      border: OutlineInputBorder(),
                    ),
                    obscureText: true,
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context, '/forgot-password');
                        },
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Color.fromARGB(255, 142, 99, 204),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();

                      // Check if the entered email and password match any student
                      bool validUser = false;
                      for (var student in students) {
                        if (student.email == email && student.pass == password) {
                          validUser = true;
                          // If valid, navigate to student dashboard
                          Navigator.pushReplacementNamed(context, '/student-dashboard');
                          break;
                        }
                      }

                      // If no match found, show an error message
                      if (!validUser) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Invalid email or password')),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                    child: Text('Login'),
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Dont Have an Account? ",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacementNamed(
                            context, '/student-signup');
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Color.fromARGB(255, 142, 99, 204),
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
