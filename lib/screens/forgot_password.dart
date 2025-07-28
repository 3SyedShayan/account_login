import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _form = GlobalKey<FormState>();

  String _enteredEmail = '';

  void _resetPassword() async {
    bool isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }

    _form.currentState!.save();

    try {
      await _firebase.sendPasswordResetEmail(email: _enteredEmail);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password reset email sent to $_enteredEmail'),
          backgroundColor: Colors.green,
        ),
      );

      Navigator.pop(context); // Return to previous screen
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error: ${error.toString()}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Forgot Password',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                'Enter your email and we will send you confirmation code to reset your password.',
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 10),
              Text(
                "Email Address",
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 10),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email Address',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email address';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredEmail = value!;
                },
              ),
              Spacer(),
              ElevatedButton(
                onPressed: _resetPassword,
                child: Text("Continue"),
              ),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
