import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:foods_app/Login_page.dart';

class CreatePassword extends StatefulWidget {
  const CreatePassword({Key? key}) : super(key: key);

  @override
  State<CreatePassword> createState() => _CreatePasswordState();
}

class _CreatePasswordState extends State<CreatePassword> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _cpasswordController = TextEditingController();
  bool _isNameValid = false;
  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _iscPasswordValid = false;
  bool _isChecked = false;
  bool _isPasswordVisible = false;
  bool _iscPasswordVisible = false;

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  void _validatePassword(String value) {
    setState(() {
      _isPasswordValid = value.isNotEmpty;
    });
  }

  void _validatecPassword(String value) {
    setState(() {
      _iscPasswordValid = value.isNotEmpty;
    });
  }

  void _showSignUpAlert() {
    final Size size = MediaQuery.of(context).size;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Center(
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
                  child: const Center(
                      child: Icon(Icons.check, color: Colors.white)),
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
                  height: size.height * 0.07,
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
          Image.asset('assets/images/image12.png'),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Center(
                child: Container(
                  height: size.height * 00.57,
                  width: size.width * 0.819,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(top: size.height * 0.05),
                    child: Column(
                      children: [
                        const Text(
                          'CREATE PASSWORD',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        const Text(
                          'Create your new password to login',
                          style: TextStyle(
                            fontSize: 15,
                            color: Colors.grey,
                            // fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                        SizedBox(
                          width: size.width * 0.7,
                          height: size.height * 0.07,
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
                        SizedBox(height: size.height * 0.03),
                        SizedBox(
                          width: size.width * 0.7,
                          height: size.height * 0.07,
                          child: TextFormField(
                            controller: _cpasswordController,
                            onChanged: _validatePassword,
                            obscureText:
                                !_iscPasswordVisible, // Hide/show password based on visibility state
                            decoration: InputDecoration(
                              labelText: 'Confirm Password',
                              border: const OutlineInputBorder(),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 195, 90, 52),
                                ),
                              ),
                              suffixIcon: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _iscPasswordVisible =
                                        !_iscPasswordVisible; // Toggle password visibility
                                  });
                                },
                                child: Icon(
                                  _iscPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        GestureDetector(
                          onTap: () {
                            _showSignUpAlert();
                          },
                          child: Container(
                            width: size.width * 0.7,
                            height: size.height * 0.06,
                            decoration: const BoxDecoration(
                              color: Color.fromARGB(255, 195, 90, 52),
                              shape: BoxShape.rectangle,
                            ),
                            child: const Center(
                              child: Text(
                                'CREATE PASSWORD',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Image.asset(
                            'assets/images/image6.png',
                            color: Color.fromARGB(255, 195, 90, 52),
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
          Positioned(
              top: size.height * 00.22,
              left: size.width * 0.09,
              child: Image.asset(
                'assets/images/image13.png',
                scale: 1.5,
              ))
        ],
      ),
    );
  }
}
