import 'package:account_login/main.dart';
import 'package:account_login/screens/forgot_password.dart';
import 'package:account_login/screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

final _firebase = FirebaseAuth.instance;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordObscured = true;
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
        final userCredential = await _firebase.signInWithCredential(
          EmailAuthProvider.credential(
            email: _enteredEmail,
            password: _enteredPassword,
          ),
        );
        print('User logged in: ${userCredential.user?.email}');
      } on FirebaseAuthException catch (error) {
        print('Error logging in: $error');
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
                  'Login to your \naccount.',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                Text(
                  "Please sign in to your account",
                  style: TextStyle(color: grey),
                ),
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
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ForgotPasswordScreen(),
                        ),
                      );
                    },
                    child: Text(
                      "Forgot password?",
                      style: TextStyle(color: orange),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    onSubmit();
                  },
                  child: Text('Sign in'),
                ),
                SizedBox(height: 20),

                Row(
                  children: [
                    Expanded(child: Divider(endIndent: 20)),
                    Text('Or sign in with', style: TextStyle(color: grey)),
                    Expanded(child: Divider(indent: 20)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterScreen(),
                          ),
                        );
                      },
                      child: Text('Register'),
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
