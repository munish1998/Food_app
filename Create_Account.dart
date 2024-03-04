// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:foods_app/Login_page.dart';
// import 'package:foods_app/Widgets/MyButton.dart';
// import 'package:foods_app/Widgets/Textfield.dart';
// import 'package:foods_app/Widgets/Top-Title.dart';
// import 'package:foods_app/Widgets/haveanaccout.dart';
// import 'package:foods_app/Widgets/mytextformfield.dart';
// import 'package:foods_app/utils.dart';

// class SignUp extends StatefulWidget {
//   @override
//   _SignUpState createState() => _SignUpState();
// }

// class _SignUpState extends State<SignUp> {
//   bool isMale = false;

//   final TextEditingController email = TextEditingController();
//   final TextEditingController fullName = TextEditingController();
//   final TextEditingController phoneNumber = TextEditingController();
//   final TextEditingController address = TextEditingController();
//   final TextEditingController password = TextEditingController();
//   static String p =
//       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//   static RegExp regExp = new RegExp(p);
//   bool isLoading = false;

//   // Future<void> CreateAccount() async {
//   //   String email = emailcontroller.text.trim();
//   //   String fullName = fullNamecontroller.text.trim();
//   //   String phoneNumber = phoneNumbercontroller.text.trim();
//   //   String address = addresscontroller.text.trim();
//   //   String password = passwordcontroller.text.trim();

//   //   if (email == '' ||
//   //       fullName == '' ||
//   //       password == "" ||
//   //       phoneNumber == '' ||
//   //       address == '') {
//   //     EasyLoading.show(status: "Please wait..");
//   //   } else {
//   //     try {
//   //       UserCredential userCredential = await FirebaseAuth.instance
//   //           .createUserWithEmailAndPassword(email: email, password: password);
//   //       // EasyLoading.show(status: "Please wait..");
//   //       Utils.snackBar('Signin Successfully', context);
//   //       Navigator.push(
//   //           context, MaterialPageRoute(builder: (context) => LoginPage()));
//   //       try {
//   //         var response = FirebaseFirestore.instance.collection('users');
//   //         response.add({
//   //           'name': fullNamecontroller.text.trim(),
//   //           'email': emailcontroller.text.trim(),
//   //           'password': passwordcontroller.text.trim(),
//   //           'mobile no.': phoneNumbercontroller.text.trim(),
//   //           'address': addresscontroller.text.trim()
//   //         });
//   //       } catch (e) {}
//   //       print('successfully');
//   //     } catch (e) {
//   //       print('$e');
//   //     }
//   //   }
//   // }
//   UserCredential? authResult;
//   void submit() async {
//     setState(() {
//       isLoading = true;
//     });
//     try {
//       authResult = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//           email: email.text, password: password.text);
//     } on PlatformException catch (e) {
//       String message = "Please Check Internet";
//       if (e.message != null) {
//         message = e.message.toString();
//       }
//       SnackBar(
//         content: Text(message),
//       );

//       setState(() {
//         isLoading = false;
//       });
//     } catch (e) {
//       setState(() {
//         isLoading = false;
//       });
//       //  SnackBar(
//       //     content: Text(message1),
//       //   );
//     }
//     await FirebaseFirestore.instance
//         .collection("users")
//         .doc(authResult!.user!.uid)
//         .set({
//       "UserName": fullName.text,
//       "UserEmail": email.text,
//       "UserId": authResult!.user!.uid,
//       "UserNumber": phoneNumber.text,
//       "UserAddress": address.text,
//       "UserGender": isMale == true ? "Male" : "Female"
//     });
//     // Navigator.of(context).pushReplacement(
//     //   MaterialPageRoute(
//     //     builder: (ctx) => HomePag(),
//     //   ),
//     // );
//     setState(() {
//       isLoading = false;
//     });
//   }

//   void vaildation() {
//     if (email.text.isEmpty &&
//         password.text.isEmpty &&
//         fullName.text.isEmpty &&
//         address.text.isEmpty &&
//         phoneNumber.text.isEmpty) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else if (fullName.text.isEmpty) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else if (email.text.isEmpty) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else if (!regExp.hasMatch(email.text)) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else if (phoneNumber.text.isEmpty) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else if (phoneNumber.text.length < 11) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else if (password.text.isEmpty) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else if (password.text.length < 8) {
//       SnackBar(
//         content: Text("Password Is Empty"),
//       );
//     } else {
//       // CreateAccount();
//       submit();
//     }
//   }

//   final GlobalKey<ScaffoldState> scaffold = GlobalKey<ScaffoldState>();

//   Widget _buildAllTextFormField() {
//     return Container(
//       height: 400,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           MyTextFormField(
//             controller: fullName,
//             title: "FullName",
//           ),
//           MyTextFormField(
//             controller: email,
//             title: "Email",
//           ),
//           MyTextFormField(
//             controller: phoneNumber,
//             title: "Phone Number",
//           ),
//           MyTextFormField(
//             controller: address,
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
//             controller: password,
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
//     return Scaffold(
//       key: scaffold,
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
