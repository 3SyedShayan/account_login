import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _form = GlobalKey<FormState>();
  var _isLogin = false;
  var _enteredEmail = '';
  var _enteredPassword = '';
  void onSubmit() async {
    bool isValid = _form.currentState!.validate();
    print('Form is valid: $isValid');
    if (!isValid) {
      return;
    }

    _form.currentState!.save();
    if (_isLogin) {
      print(
        'Logging in with email: $_enteredEmail and password: $_enteredPassword',
      );
    } else {
      try {
        final userCredential = await _firebase.createUserWithEmailAndPassword(
          email: _enteredEmail,
          password: _enteredPassword,
        );
        print('User created: ${userCredential.user?.email}');
      } on FirebaseAuthException catch (error) {
        print('Error creating user: $error');
      }
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
                'Login to your \naccount.',
                style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
              ),
              Text("Please sign in to your account"),
              SizedBox(height: 25),
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
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Please enter a valid email';
                  }
                  return null;
                },
                onSaved: (value) {
                  _enteredEmail = value!;
                },
              ),
              Text("Password", style: TextStyle(fontWeight: FontWeight.w500)),
              SizedBox(height: 10),

              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: 'Enter Password',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onChanged: (value) {},
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
              Text("Forgot Password?"),
              ElevatedButton(
                onPressed: () {
                  onSubmit();
                },
                child: Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
