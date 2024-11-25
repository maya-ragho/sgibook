// // import 'package:flutter/material.dart';
// // import 'package:khatabook/view/auth_screen/otp_enter.dart';
// // class OtpScreen extends StatefulWidget {
// //   const OtpScreen({super.key});
// //
// //   @override
// //   State<OtpScreen> createState() => _OtpScreenState();
// // }
// //
// // class _OtpScreenState extends State<OtpScreen> {
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenHeight = MediaQuery.of(context).size.height;
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Row(
// //           children: [
// //             Icon(Icons.book,color: Colors.red,),
// //             Text('Khatabook', style: TextStyle(color: Colors.red),),
// //           ],
// //         ),
// //       ),
// //       body: Column(
// //         children: [
// //           Container(
// //             decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(10),
// //                 boxShadow: [
// //                   BoxShadow(
// //                       offset:  Offset(0, 5),
// //                       color: Theme.of(context).primaryColor.withOpacity(.2),
// //                       spreadRadius: 2,
// //                       blurRadius: 5)
// //                 ]),
// //
// //             child: Container(
// //               height: 50 ,// Responsive height
// //               width: 370,
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(5),
// //               ),
// //               child: Row(
// //                 children: [
// //                   Icon(Icons.circle),
// //                   Text('Trusted by 5 Crore + businesses across India',style: TextStyle(color: Color(0xFF666666), fontSize: 16)),
// //                 ],
// //               ),
// //             ),
// //           ),
// //           SizedBox(height: 20),
// //           Padding(
// //             padding: EdgeInsets.all(12.0),
// //             child: Row(
// //               children: [
// //                 Container(
// //                   height: screenHeight * 0.06, // Responsive height
// //                   width: screenWidth * 0.2, // 80% of screen width
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(6),
// //                     border: Border.all(
// //                       width: 0.4,
// //                       color: Colors.black,
// //                     ),
// //                     // color: const Color(0xffFA6650),
// //                   ),
// //                   child: Padding(
// //                     padding: EdgeInsets.symmetric(horizontal: 8.0,vertical: 8.0),
// //                     child: Row(
// //                       children: [
// //                         Image.asset('assets/img.png', height: 20,width: 20,),
// //                         Spacer(),
// //                         Text(
// //                           '+91',
// //                           style: TextStyle(color: Color(0xFF666666), fontSize: 16),textAlign: TextAlign.start,
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 Spacer(),
// //                 Container(
// //                   height: screenHeight * 0.06, // Responsive height
// //                   width: screenWidth * 0.7, // 80% of screen width
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(6),
// //                     border: Border.all(
// //                       width: 0.4,
// //                       color: Colors.black,
// //                     ),
// //                   ),
// //                   child: Padding(
// //                     padding: const EdgeInsets.only(left: 12.0, top: 10.0),
// //                     child: Text(
// //                       maxLines: 1,
// //                       'Mobile Number',
// //                       style: TextStyle(color: Color(0xFF666666), fontSize: 16),textAlign: TextAlign.left,
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //           ),
// //           Spacer(),
// //            Padding(
// //              padding:  EdgeInsets.only(bottom: 8.0,left: 8.0, right: 8.0),
// //              child: Container(
// //               height: screenHeight * 0.06, // Responsive height
// //               width: screenWidth * 1, // 80% of screen width
// //               decoration: BoxDecoration(
// //                 borderRadius: BorderRadius.circular(6),
// //                 border: Border.all(
// //                   width: 0.2,
// //                   color: Colors.grey,
// //                 ),
// //                 color:Colors.blueAccent
// //               ),
// //               child:  Center(
// //                 child: InkWell(
// //                   onTap: (){
// //                     Navigator.push(context, MaterialPageRoute(builder: (context)=>EnterOtp()));
// //                   },
// //                   child: Text(
// //                     'GET OTP',
// //                     style: TextStyle(color: Colors.white, fontSize: 16),
// //                   ),
// //                 ),
// //               ),
// //                        ),
// //            ),
// //         ],
// //       ),
// //     );
// //   }
// //
// // }
// //
// //
//
// // import 'package:firebase_auth/firebase_auth.dart';
// // import 'package:flutter/material.dart';
// // import 'package:khatabook/view/auth_screen/otp_enter.dart';
// //
// // class PhoneAuth extends StatefulWidget {
// //   const PhoneAuth({super.key});
// //
// //   @override
// //   State<PhoneAuth> createState() => _PhoneAuthState();
// // }
// //
// // class _PhoneAuthState extends State<PhoneAuth> {
// //   final TextEditingController _phoneController = TextEditingController();
// //   final TextEditingController _codeController = TextEditingController();
// //   late String _verificationId;
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     void _verifyPhoneNumber() async {
// //       await FirebaseAuth.instance.verifyPhoneNumber(
// //         phoneNumber: "+91" + _phoneController.text,
// //         verificationCompleted: (PhoneAuthCredential credential) async {
// //           await FirebaseAuth.instance.signInWithCredential(credential);
// //         },
// //         verificationFailed: (FirebaseAuthException e) {
// //           if (e.code == 'invalid-phone-number') {
// //             print('The provided phone number is not valid.');
// //           }
// //         },
// //         codeSent: (String verificationId, int? resendToken) {
// //           setState(() {
// //             _verificationId = verificationId;
// //           });
// //         },
// //         codeAutoRetrievalTimeout: (String verificationId) {
// //           setState(() {
// //             _verificationId = verificationId;
// //           });
// //         },
// //       );
// //     }
// //
// //     // void _signInWithPhoneNumber() async {
// //     //   final code = _codeController.text.trim();
// //     //   PhoneAuthCredential credential = PhoneAuthProvider.credential(
// //     //     verificationId: _verificationId,
// //     //     smsCode: code,
// //     //   );
// //     //
// //     //   await FirebaseAuth.instance.signInWithCredential(credential);
// //     // }
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('Phone Auth'),
// //         centerTitle: true,
// //       ),
// //       body: Column(
// //         mainAxisAlignment: MainAxisAlignment.center,
// //         children: [
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 25),
// //             child: TextField(
// //               controller: _phoneController,
// //               keyboardType: TextInputType.number,
// //               decoration: InputDecoration(
// //                   hintText: "Enter Phone Number",
// //                   suffixIcon: Icon(Icons.phone),
// //                   border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(25))),
// //             ),
// //           ),
// //           SizedBox(
// //             height: 30,
// //           ),
// //           ElevatedButton(
// //               onPressed: (){
// //                 _verifyPhoneNumber();
// //                 Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(mobileNumber: _phoneController.text),));
// //               },
// //               child: Text('Verify phone Number')),
// //
// //         ],
// //       ),
// //     );
// //   }
// // }
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sgibook/view/auth_screen/otp_enter.dart';
//
// class PhoneAuth extends StatefulWidget {
//   const PhoneAuth({super.key});
//
//   @override
//   State<PhoneAuth> createState() => _PhoneAuthState();
// }
//
// class _PhoneAuthState extends State<PhoneAuth> {
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController codeController = TextEditingController();
//   late String verificationId;
//
//   @override
//   void initState() {
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Phone Auth'),
//         centerTitle: true,
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 25),
//             child: TextField(
//               controller: phoneController,
//               // keyboardType: TextInputType.number,
//               decoration: InputDecoration(
//                   hintText: "Enter Phone Number",
//                   suffixIcon: Icon(Icons.phone),
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(25))),
//             ),
//           ),
//           SizedBox(
//             height: 30,
//           ),
//           ElevatedButton(
//               onPressed: () async {
//                 await FirebaseAuth.instance.verifyPhoneNumber(
//                     verificationCompleted: (PhoneAuthCredential credential) {},
//                     verificationFailed: (FirebaseAuthException ex) {},
//                     codeSent: (String verificationid, int? resendtoken) {
//                        Navigator.push(context, MaterialPageRoute(builder: (context) => OTPScreen(mobileNumber: phoneController.text, verificationid: verificationid,),));
//
//                     },
//                     codeAutoRetrievalTimeout: (String verificationId) {},
//                     phoneNumber: phoneController.text.toString());
//               },
//               child: Text('Verify phone Number')),
//         ],
//       ),
//     );
//   }
// }
