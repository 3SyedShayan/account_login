import 'package:account_login/main.dart';
import 'package:account_login/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _isPasswordObscured = true;
  final _form = GlobalKey<FormState>();
  String _enteredEmail = '';
  String _enteredPassword = '';
  String _enteredUsername = '';
  bool _isTermsAccepted = false;

  void onSubmit() async {
    print('Submitting registration form');
    bool isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    } else {
      print("Email before Saving: $_enteredEmail");
      _form.currentState!.save();
      print("Email after Saving: $_enteredEmail");
      try {
        final userCredentials = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
      } catch (error) {
        print("Error occurred while registering: $error");
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 245, 245),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
          child: Form(
            key: _form,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create your new \naccount',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),

                Text(
                  "Create an account to start looking for the food you like",
                  style: TextStyle(color: grey),
                ),

                SizedBox(height: 15),

                Text(
                  "Email Address",
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 10),
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Enter Email',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null ||
                        value.isEmpty ||
                        !value.contains('@')) {
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredEmail = value!;
                  },
                ),
                SizedBox(height: 10),
                Text("Username", style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(height: 10),
                TextFormField(
                  decoration: InputDecoration(
                    labelText: 'Enter Username',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your username';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredUsername = value!;
                  },
                ),
                SizedBox(height: 10),
                Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
                SizedBox(height: 10),

                TextFormField(
                  keyboardType: TextInputType.visiblePassword,
                  decoration: InputDecoration(
                    labelText: 'Enter Password',
                    border: OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordObscured
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: () {
                        _isPasswordObscured = !_isPasswordObscured;
                        setState(() {});
                      },
                    ),
                  ),
                  obscureText: _isPasswordObscured,
                  // onChanged: (value) {},
                  validator: (value) {
                    if (value == null || value.isEmpty || value.length < 6) {
                      return 'Please enter your password';
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _enteredPassword = value!;
                  },
                ),
                Row(
                  children: [
                    Checkbox(
                      value: _isTermsAccepted,
                      onChanged: (value) {
                        _isTermsAccepted = value!;
                        setState(() {});
                      },
                    ),
                    Text("I Agree with Terms of Service and Privacy Policy"),
                  ],
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    onSubmit();
                  },
                  child: Text("Register"),
                ),
                SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Divider(thickness: 1, endIndent: 10, indent: 0),
                    ),
                    Text('Or register with', style: TextStyle(color: grey)),
                    Expanded(
                      child: Divider(thickness: 1, endIndent: 0, indent: 10),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Text("Don't have an Account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ),
                        );
                      },
                      child: Text('Sign in'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
