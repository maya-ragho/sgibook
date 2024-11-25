// import 'package:flutter/material.dart';
// import 'package:khatabook/view/home_page.dart';
//
// class EnterOtp extends StatefulWidget {
//   const EnterOtp({super.key});
//
//   @override
//   State<EnterOtp> createState() => _EnterOtpState();
// }
//
// class _EnterOtpState extends State<EnterOtp> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         title: Row(
//           children: [
//             Icon(Icons.book,color: Colors.red,),
//             Text('Khatabook', style: TextStyle(color: Colors.red),),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(10),
//                 boxShadow: [
//                   BoxShadow(
//                       offset:  Offset(0, 5),
//                       color: Theme.of(context).primaryColor.withOpacity(.2),
//                       spreadRadius: 2,
//                       blurRadius: 5)
//                 ]),
//
//             child: Container(
//               height: 50 ,// Responsive height
//               width: 370,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(5),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.circle),
//                   SizedBox(width: 6,),
//                   Flexible(
//                     child: Text(
//                         'OTP +91 8080371669 वर  पाठवला  आहे  क्रमांक  संपादित  करा' , softWrap: true,),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 20),
//           Padding(
//             padding:  EdgeInsets.all(12.0),
//             child: Row(
//               children: [
//                 Container(
//                   height: screenHeight * 0.06, // Responsive height
//                   width: screenWidth * 0.7, // 80% of screen width
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(6),
//                     border: Border.all(
//                       width: 0.4,
//                       color: Colors.black,
//                     ),
//                   ),
//                   child: Padding(
//                     padding:  EdgeInsets.only(left: 12.0, top: 10.0),
//                     child: Text(
//                       maxLines: 1,
//                       '6 अंकी OTP करा एंटर करा',
//                       style: TextStyle(color: Colors.black, fontSize: 16),textAlign: TextAlign.left,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           Spacer(),
//           Padding(
//             padding:  EdgeInsets.only(bottom: 8.0,left: 8.0, right: 8.0),
//             child: Container(
//               height: screenHeight * 0.06, // Responsive height
//               width: screenWidth * 1, // 80% of screen width
//               decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(6),
//                   border: Border.all(
//                     width: 0.2,
//                     color: Colors.grey,
//                   ),
//                   color:Colors.blueAccent
//               ),
//               child:  Center(
//                 child: InkWell(
//                   onTap: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
//                   },
//                   child: Text(
//                     'समाविष्ट  करा',
//                     style: TextStyle(color: Colors.white, fontSize: 16),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


//IMPPPPPPPPPPPP
// import 'dart:developer'; // For logging errors
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:sgibook/view/home_page.dart';
//
// class OTPScreen extends StatefulWidget {
//   final String verificationid; // Final to ensure immutability
//   final String mobileNumber; // To display the number if needed
//
//   OTPScreen({super.key, required this.verificationid, required this.mobileNumber});
//
//   @override
//   State<OTPScreen> createState() => _OTPScreenState();
// }
//
// class _OTPScreenState extends State<OTPScreen> {
//   TextEditingController otpController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('OTP Verification'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Enter the OTP sent to ${widget.mobileNumber}',
//               style: TextStyle(fontSize: 16),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 20),
//             TextField(
//               controller: otpController,
//               keyboardType: TextInputType.number,
//               maxLength: 6,
//               decoration: InputDecoration(
//                 hintText: "Enter 6-digit OTP",
//                 suffixIcon: Icon(Icons.sms),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                 ),
//               ),
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: _verifyOTP,
//               child: Text('Verify OTP'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Future<void> _verifyOTP() async {
//     // Validate OTP input
//     if (otpController.text.isEmpty || otpController.text.length != 6) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Please enter a valid 6-digit OTP')),
//       );
//       return;
//     }
//
//     try {
//       // Create phone auth credential
//       PhoneAuthCredential credential = PhoneAuthProvider.credential(
//         verificationId: widget.verificationid,
//         smsCode: otpController.text,
//       );
//
//       // Sign in with the credential
//       await FirebaseAuth.instance.signInWithCredential(credential).then((value) {
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => HomePage()),
//         );
//       });
//     } catch (e) {
//       log('Error during OTP verification: $e');
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('Verification failed. Please try again.')),
//       );
//     }
//   }
// }
//
//IMPPPPPPPPPP
//





// Text(isTimerRunning ? 'Resend OTP in $otpTimer s': "Din\'t receive OTP?," ,style: TextStyle(color: Colors.grey),),
// ElevatedButton(
//     onPressed: isTimerRunning ? null : () async {
//       setState(() {
//         isTimerRunning = true;
//       });
//       otpTimer 60;
//       Timer.periodic(Duration(seconds: 1), (timer) {
//         setState(() {
//           otpTimer--;
//           if(otpTimer == 0){
//             timer.cancel();
//             isTimerRunning = false;
//           }
//         });
//       });
//
//       Navigator.push(
//           context,
//           MaterialPageRoute(
//             builder: (context) => Select(),
//           ));
//     },
//     child: Text('Verify OTP')
// )//   //
