import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:foods_app/Controllers/Google_SignIn_Controller.dart';
import 'package:foods_app/Forget_Password.dart';
import 'package:foods_app/Home_Screen.dart';
import 'package:foods_app/Screens/Main_Screen.dart';
import 'package:foods_app/Sign_Up_Page.dart';
import 'package:foods_app/utils.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  final GoogleSignInController _googleSignInController =
      Get.put(GoogleSignInController());

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isChecked = false;
  bool _isPasswordVisible = false; // Track password visibility

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> SignIn() async {
    String email = _emailController.text.trim();
    String password = _passwordController.text.trim();
    // if (!_isChecked) {
    //   // If terms and conditions checkbox is not checked, show error message
    //   Utils.flushBarErrorMessage(
    //       'Please agree to the terms and conditions', context);
    //   return;
    // }
    if (email.isEmpty || password.isEmpty) {
      Utils.flushBarErrorMessage('Please fill in all the details', context);
    } else if (!_isEmailValid) {
      Utils.flushBarErrorMessage('Please enter a valid email address', context);
    } else if (!_isPasswordValid) {
      Utils.flushBarErrorMessage(
          'Password must be at least 6 characters long', context);
    } else {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: email, password: password);
        // Navigate to HomeScreen if login is successful
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => HomeScreen()));
        Utils.flushBarErrorMessage('Login successful', context);
        _showSignUpAlert();
        print('Login successful');
      } on FirebaseAuthException catch (e) {
        if (e.code == 'user-not-found' || e.code == 'wrong-password') {
          Utils.flushBarErrorMessage('Incorrect email or password', context);
        } else {
          // Handle other FirebaseAuthException errors
          Utils.flushBarErrorMessage('Error: ${e.message}', context);
          print('FirebaseAuthException: ${e.message}');
        }
      } catch (e) {
        // Handle generic errors
        Utils.flushBarErrorMessage('Error: $e', context);
        print('$e');
      }
      // _showSignUpAlert();
    }
  }

  Future<void> _signInWithGoogle(BuildContext context) async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    final GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        final GoogleSignInAuthentication googleSignInAuthentication =
            await googleSignInAccount.authentication;
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleSignInAuthentication.accessToken,
          idToken: googleSignInAuthentication.idToken,
        );

        // Sign in with Firebase using Google credentials
        final UserCredential userCredential =
            await _auth.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          // User signed in successfully
          // Navigate to the next screen or perform other actions
        } else {
          // Handle sign-in failure
          // Show error message or try alternative sign-in method
        }
      }
    } catch (e) {
      print('Error signing in with Google: $e');
      // Handle sign-in failure
      // Show error message or try alternative sign-in method
    }
  }

  void _validateEmail(String value) {
    setState(() {
      _isEmailValid =
          RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value);
    });
  }

  void _validatePassword(String value) {
    setState(() {
      _isPasswordValid =
          value.length >= 6; // Assuming minimum 6 characters required
    });
  }

  void _onCheckboxChanged(bool? newValue) {
    setState(() {
      _isChecked = newValue ?? false;
    });
  }

  void _showSignUpAlert() {
    final Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
          child: Material(
            child: Container(
              height: 495,
              width: 370,
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
                    width: size.width * 0.7,
                    height: size.height * 0.08,
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
                                  builder: (context) => HomeScreen()));
                        },
                        child: const Text(
                          'Go to Home Page',
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
      body: Expanded(
        child: Stack(
          children: [
            Image.asset('assets/images/image8.png'),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(40),
                  topLeft: Radius.circular(40),
                ),
                child: SingleChildScrollView(
                  child: Container(
                    height: size.height * 0.71,
                    width: size.width * 0.999,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(top: size.height * 0.05),
                      child: Column(
                        children: [
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.1,
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
                          SizedBox(
                            width: size.width * 0.8,
                            height: size.height * 0.08,
                            child: TextFormField(
                              controller: _passwordController,
                              onChanged: _validatePassword,
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
                          SizedBox(
                            width: size.width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ForgetPassword()));
                                  },
                                  child: const Text(
                                    'Forget Password?',
                                    style: TextStyle(
                                      color: Color.fromARGB(255, 195, 90, 52),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                left: size.width * 0.05,
                                top: size.height * 0.02),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Checkbox(
                                  value: _isChecked,
                                  onChanged:
                                      _onCheckboxChanged, // Update checkbox state
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
                                          color:
                                              Color.fromARGB(255, 195, 90, 52),
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
                                          color:
                                              Color.fromARGB(255, 195, 90, 52),
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
                              SignIn();
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomeScreen()));
                              Navigator.pop(context);
                              //_showSignUpAlert();
                            },
                            child: Container(
                              width: 340,
                              //width: size.width * 0.7,
                              height: 50,
                              // height: size.height * 0.08,
                              decoration: BoxDecoration(
                                color: _isChecked
                                    ? Color.fromARGB(255, 195, 90, 52)
                                    : Color.fromARGB(255, 195, 90, 52),
                                // color: Color.fromARGB(255, 195, 90, 52),
                                shape: BoxShape.rectangle,
                              ),
                              child: const Center(
                                child: Text(
                                  'LOGIN',
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
                          const Text(
                            'OR',
                            style: TextStyle(
                              fontSize: 15,
                              color: Color.fromARGB(255, 195, 90, 52),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: size.height * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                  onTap: () {
                                    GoogleSignInController();
                                    _signInWithGoogle(context);
                                  },
                                  child:
                                      Image.asset('assets/images/image9.png')),
                              Image.asset('assets/images/image10.png'),
                              Image.asset('assets/images/image11.png'),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUpPage()));
                            },
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(fontSize: 15),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'Dont  have an account? ',
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'SignUp',
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
              top: size.height * 0.29,
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
                        // Navigator.of(context).pushReplacement(
                        //   MaterialPageRoute(
                        //       builder: (_) => const TutorialScreen()),
                        // );
                      },
                      child: const Icon(
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
      ),
    );
  }
}
