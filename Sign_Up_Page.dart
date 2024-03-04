import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:foods_app/Login_page.dart';
import 'package:foods_app/Models/User_Models.dart';
import 'package:foods_app/utils.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isChecked = false;
  bool _isPasswordVisible = false; // Track password visibility

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> CreateAccount() async {
    String name = _nameController.text.trim();
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();

    if (name.isEmpty || email.isEmpty || password.isEmpty) {
      Utils.flushBarErrorMessage('Please fill all the details', context);
      return;
    }

    try {
      UserCredential userCredential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      Utils.flushBarErrorMessage('Sign Up Successful', context);
      _showSignUpAlert();
      // Redirect to success page or do any necessary operations
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Utils.flushBarErrorMessage(
            'The password provided is too weak.', context);
      } else if (e.code == 'email-already-in-use') {
        Utils.flushBarErrorMessage(
            'The account already exists for that email.', context);
      } else if (e.code == 'invalid-email') {
        Utils.flushBarErrorMessage('The email address is invalid.', context);
      }
    } catch (e) {
      print('Error creating user: $e');
      Utils.flushBarErrorMessage(
          'Error creating user. Please try again.', context);
    }
  }

  void _validateName(String value) {
    setState(() {
      _isNameValid = value.isNotEmpty;
    });
  }

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid =
          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    });
  }

  // void _validatePassword(String value) {
  //   setState(() {
  //     _isPasswordValid =
  //         value.length >= 6; // Assuming minimum 6 characters required
  //   });
  // }

  void _showSignUpAlert() {
    final Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            child: Container(
              height: 485,
              width: 350,
              // color: Colors.red,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(25)),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/image7.png',
                      color: Color.fromARGB(255, 195, 90, 52),
                    ),
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 195, 90, 52),
                      shape: BoxShape.circle,
                    ),
                    child:
                        Center(child: Icon(Icons.check, color: Colors.white)),
                  ),
                  const SizedBox(
                    height: 45,
                  ),
                  const Text(
                    'Success',
                    style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Your account has been successfully ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(81, 0, 0, 0),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const Text(
                    'registered ',
                    style: TextStyle(
                      fontSize: 17,
                      color: Color.fromARGB(81, 0, 0, 0),
                      decoration: TextDecoration.none,
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: 264,
                    height: 50,
                    // width: size.width * 0.7,
                    // height: size.height * 0.08,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 195, 90, 52),
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => LoginPage()));
                        },
                        child: const Text(
                          'Go to Login Page',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              decoration: TextDecoration.none),
                        ),
                      ),
                    ),
                  ),
                  // Text('Success'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Image.asset('assets/images/image4.png'),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(40),
                topLeft: Radius.circular(40),
              ),
              child: SingleChildScrollView(
                child: Container(
                  height: size.height * 0.69,
                  width: size.width * 0.999,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Column(
                      children: [
                        const Text(
                          'SIGN UP',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          //color: Colors.orange,
                          width: size.width * 0.8,
                          height: size.height * 0.06,
                          child: TextFormField(
                            controller: _nameController,
                            onChanged: _validateName,
                            decoration: InputDecoration(
                              labelText: 'Name',
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 195, 90, 52),
                                ),
                              ),
                              suffixIcon: _isNameValid
                                  ? const Icon(
                                      Icons.check,
                                      color: Color.fromARGB(255, 195, 90, 52),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          // color: Colors.yellow,
                          width: size.width * 0.8,
                          height: size.height * 0.06,
                          child: TextFormField(
                            controller: _emailController,
                            onChanged: _validateEmail,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 195, 90, 52),
                                ),
                              ),
                              suffixIcon: _isEmailValid
                                  ? const Icon(
                                      Icons.check,
                                      color: Color.fromARGB(255, 195, 90, 52),
                                    )
                                  : null,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          // color: Colors.pink,
                          width: size.width * 0.8,
                          height: size.height * 0.06,
                          child: TextFormField(
                            controller: _passwordController,
                            //onChanged: _validatePassword,
                            obscureText:
                                !_isPasswordVisible, // Hide/show password based on visibility state
                            decoration: InputDecoration(
                              labelText: 'Password',
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 195, 90, 52),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isPasswordVisible =
                                        !_isPasswordVisible; // Toggle password visibility
                                  });
                                },
                                child: Icon(
                                  _isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Padding(
                          padding: EdgeInsets.only(
                              left: size.width * 0.05, top: size.height * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Checkbox(
                                value: _isChecked,
                                onChanged: (newValue) {
                                  setState(() {
                                    _isChecked = newValue ?? false;
                                  });
                                },
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              RichText(
                                text: const TextSpan(
                                  style: TextStyle(fontSize: 15),
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'I agree to the Grocery ',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Terms of Service ',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 195, 90, 52),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'and\n ',
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'privacy policy',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 195, 90, 52),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        GestureDetector(
                          onTap: () {
                            CreateAccount();
                            // _showSignUpAlert();
                          },
                          child: Container(
                            width: 340,
                            // width: size.width * 0.7,
                            height: 50,
                            // height: size.height * 0.08,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 195, 90, 52),
                              shape: BoxShape.rectangle,
                            ),
                            child: const Center(
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginPage()));
                          },
                          child: RichText(
                            text: const TextSpan(
                              style: TextStyle(fontSize: 15),
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'Already have an account? ',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                                TextSpan(
                                  text: 'Login',
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 195, 90, 52),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.only(bottom: size.height * 0.005),
              height: 2.8,
              width: 80,
              color: Colors.grey,
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Image.asset(
              'assets/images/image6.png',
              color: Color.fromARGB(255, 195, 90, 52),
            ),
          ),
          Positioned(
            top: size.height * 0.31,
            left: size.width * 0.0,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(45),
                topLeft: Radius.circular(40),
              ),
              child: Container(
                height: size.width * 0.2,
                width: size.width * 0.2,
                decoration: const BoxDecoration(color: Colors.black),
                child: Center(
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (_) => LoginPage()),
                      );
                    },
                    child: Icon(
                      Icons.arrow_back,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
