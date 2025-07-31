import 'package:account_login/main.dart';
import 'package:flutter/material.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController pass1 = TextEditingController();
  TextEditingController pass2 = TextEditingController();
  bool _isPass1Obscure = false;
  bool _isPass2Obscure = false;
  String password = "";
  var _form = GlobalKey<FormState>();

  void validatePasswords() {
    var isValid = _form.currentState!.validate();

    if (isValid) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Passwords are valid')));
      password = pass1.text;
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Passwords do not match')));
    }
    print(isValid);
  }

  @override
  void dispose() {
    pass1.dispose();
    pass2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _form,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Reset Password",
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text(
                "Your New Password must be different from the old password",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text("New Password", style: TextStyle(fontSize: 18)),
              TextFormField(
                controller: pass1,
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 6 ||
                      pass1.text != pass2.text) {
                    return "Please enter a new password";
                  }
                  return null;
                },
                obscureText: _isPass1Obscure,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPass1Obscure ? Icons.visibility : Icons.visibility_off,
                    ),

                    onPressed: () {
                      setState(() {
                        _isPass1Obscure = !_isPass1Obscure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Enter your new password',
                ),
                onSaved: (value) {},
              ),

              Text(
                "Must be atleast 6 characters long",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              Text("Confirm Password", style: TextStyle(fontSize: 18)),
              TextFormField(
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.length < 6 ||
                      pass1.text != pass2.text) {
                    return "Please enter a new password";
                  }
                  return null;
                },
                obscureText: _isPass2Obscure,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isPass2Obscure ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isPass2Obscure = !_isPass2Obscure;
                      });
                    },
                  ),
                  border: OutlineInputBorder(),
                  hintText: 'Confirm your new password',
                ),
                controller: pass2,
              ),
              Text(
                "Must match the new password",
                style: TextStyle(color: Colors.grey),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  validatePasswords();
                },
                child: Text("Reset Password"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
