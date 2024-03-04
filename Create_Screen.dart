// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:foods_app/Login_page.dart';
// import 'package:foods_app/Models/User_Models.dart';
// import 'package:foods_app/Widgets/MyButton.dart';
// import 'package:foods_app/Widgets/Textfield.dart';
// import 'package:foods_app/Widgets/Top-Title.dart';
// import 'package:foods_app/Widgets/haveanaccout.dart';
// import 'package:foods_app/Widgets/mytextformfield.dart';
// import 'package:foods_app/utils.dart';

// class SignUpPage1 extends StatefulWidget {
//   const SignUpPage1({Key? key}) : super(key: key);

//   @override
//   State<SignUpPage1> createState() => _SignUpPage1State();
// }

// class _SignUpPage1State extends State<SignUpPage1> {
//   bool isMale = false;
//   bool isLoading = false;
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _passwordController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();
//   final TextEditingController _addressController = TextEditingController();
//   bool _isNameValid = false;
//   bool _isEmailValid = false;
//   bool _isPasswordValid = false;
//   bool _isChecked = false;
//   bool _isPasswordVisible = false; // Track password visibility

//   @override
//   void dispose() {
//     _nameController.dispose();
//     _emailController.dispose();
//     _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> CreateAccount() async {
//     String name = _nameController.text.trim();
//     String email = _emailController.text.trim();
//     String password = _passwordController.text.trim();
//     if (name == '' || email == '' || password == "") {
//       EasyLoading.show(status: "Please wait..");
//     } else {
//       try {
//         UserCredential userCredential = await FirebaseAuth.instance
//             .createUserWithEmailAndPassword(email: email, password: password);
//         // EasyLoading.show(status: "Please wait..");
//         Utils.snackBar('Signin Successfully', context);
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => LoginPage()));
//         try {
//           var response = FirebaseFirestore.instance.collection('users');
//           response.add({
//             'name': _nameController.text.trim(),
//             'email': _emailController.text.trim(),
//             'password': _passwordController.text.trim(),
//             'mobile no.': _mobileController.text.trim(),
//             'address': _addressController.text.trim(),
//           });
//         } catch (e) {}
//         print('successfully');
//       } catch (e) {
//         print('$e');
//       }
//     }
//   }

//   void vaildation() {
//     if (_emailController.text.isEmpty &&
//         _passwordController.text.isEmpty &&
//         _nameController.text.isEmpty &&
//         _addressController.text.isEmpty &&
//         _mobileController.text.isEmpty) {
//       SnackBar(
//         content: Text("All Fleid Is Empty"),
//       );
//     } else if (_nameController.text.isEmpty) {
//       SnackBar(
//         content: Text("FullName Is Empty"),
//       );
//     } else if (_emailController.text.isEmpty) {
//       SnackBar(
//         content: Text("Email Is Empty"),
//       );
//     } else if (_emailController.text.isEmpty) {
//       SnackBar(
//         content: Text("Email Is Not Vaild"),
//       );
//     } else if (_mobileController.text.isEmpty) {
//       SnackBar(
//         content: Text("Phone Number Is Empty"),
//       );
//     } else if (_mobileController.text.length < 11) {
//       SnackBar(
//         content: Text("Phone Number Must Be 11 "),
//       );
//     } else if (_passwordController.text.isEmpty) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else if (_passwordController.text.length < 8) {
//       SnackBar(
//         content: Text("Password Is Too Short"),
//       );
//     } else {
//       CreateAccount();
//     }
//   }

//   Widget _buildAllTextFormField() {
//     return Container(
//       height: 400,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           MyTextFormField(
//             controller: _nameController,
//             title: "FullName",
//           ),
//           MyTextFormField(
//             controller: _emailController,
//             title: "Email",
//           ),
//           MyTextFormField(
//             controller: _mobileController,
//             title: "Phone Number",
//           ),
//           MyTextFormField(
//             controller: _addressController,
//             title: "Address",
//           ),
//           GestureDetector(
//             onTap: () {
//               setState(() {
//                 isMale = !isMale;
//               });
//             },
//             child: Container(
//               height: 60,
//               width: double.infinity,
//               padding: EdgeInsets.only(left: 10),
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 isMale == false ? "Female" : "Male",
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//               decoration: BoxDecoration(
//                   color: Color(0xfff5d8e4),
//                   borderRadius: BorderRadius.circular(10)),
//             ),
//           ),
//           MyPasswordTextFormField(
//             controller: _passwordController,
//             title: "Password",
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildButtonPart() {
//     return isLoading == false
//         ? MyButton(
//             name: "Sign Up",
//             onPressed: () {
//               vaildation();
//             },
//           )
//         : Center(
//             child: CircularProgressIndicator(),
//           );
//   }

//   Widget _buildHaveAccountOrNotPart() {
//     return HaveAccountOrNot(
//       onTap: () {
//         Navigator.of(context).pushReplacement(
//           MaterialPageRoute(
//             builder: (ctx) => LoginPage(),
//           ),
//         );
//       },
//       subTitle: "Login",
//       title: "I Have Already An Account?",
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;

//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
//         child: ListView(
//           children: [
//             Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 TopTitle(
//                   title: "SignUp",
//                   subsTitle: "Create an Account",
//                 ),
//                 _buildAllTextFormField(),
//                 _buildButtonPart(),
//                 _buildHaveAccountOrNotPart(),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
