// import 'package:flutter/material.dart';
// import 'package:sgibook/view/you_gave.dart';
// import 'package:sgibook/view/you_got.dart';
//
// class CustomerHistory extends StatefulWidget {
//   @override
//   _CustomerHistoryState createState() => _CustomerHistoryState();
// }
//
// class _CustomerHistoryState extends State<CustomerHistory> {
//   @override
//   Widget build(BuildContext context) {
//     final screenHeight = MediaQuery.of(context).size.height;
//     final screenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: ListTile(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Prachi',
//                 style: TextStyle(color: Colors.white),
//               ),
//               SizedBox(
//                 width: 5,
//               ),
//               Container(
//                 height: screenHeight * 0.03, // Responsive height
//                 width: screenWidth * 0.2, // 80% of screen width
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   border: Border.all(
//                     width: 0.4,
//                     color: Colors.black,
//                   ),
//                   // color: const Color(0xffFA6650),
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(
//                       top: 4.0, bottom: 4.0, right: 4),
//                   child: Text(
//                     'Customer',
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           subtitle: Text(
//             'View settings',
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: CircleAvatar(
//             radius: 20,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.call,
//               color: Colors.white,
//             ),
//             onPressed: () {},
//           ),
//         ],
//        ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.lock),
//                   SizedBox(width: 10.0),
//                   Text(
//                     'Only you and Prachi can see these entries',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//             Spacer(),
//             Container(
//               height: 120,
//               width: 350,
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     'Start adding transactions with Prachi',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Icon(Icons.arrow_downward_outlined)
//                 ],
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   height: screenHeight * 0.06, // Responsive height
//                   width: screenWidth * 0.4, // 80% of screen width
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 0.4,
//                         color: Colors.black,
//                       ),
//                       color: Colors.red),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: 10.0, top: 10.0, bottom: 10, right: 10),
//                     child: InkWell(
//                       onTap: (){
//                         Navigator.push(context, MaterialPageRoute(builder: (context)=>Calculatorgave()));
//
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             maxLines: 1,
//                             'YOU GAVE',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                           Icon(
//                             Icons.currency_rupee,
//                             color: Colors.white,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Spacer(),
//                 Container(
//                   height: screenHeight * 0.06, // Responsive height
//                   width: screenWidth * 0.4, // 80% of screen width
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 0.4,
//                         color: Colors.black,
//                       ),
//                       color: Colors.green),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: 10.0, top: 10.0, bottom: 10, right: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: (){
//                             Navigator.push(context, MaterialPageRoute(builder: (context)=>Calculatorgot()));
//                           },
//                           child: Text(
//                             maxLines: 1,
//                             'YOU GOT',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         ),
//                         Icon(
//                           Icons.currency_rupee,
//                           color: Colors.white,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// UI only


// // it show the value null
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:sgibook/view/you_gave.dart';
// import 'package:sgibook/view/you_got.dart';
//
// class CustomerHistory extends StatelessWidget {
//   final String name;
//   final String flat;
//   final String? comp;
//   final String? Id;
//
//   CustomerHistory({
//     Key? key,
//     required this.name,
//     required this.flat,
//     required this.comp,
//     required this.Id,
//   }) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     // final CollectionReference  = FirebaseFirestore.instance.collection('Book');
//
//     final ScreenHeight = MediaQuery.of(context).size.height;
//     final ScreenWidth = MediaQuery.of(context).size.width;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blue,
//         title: ListTile(
//           title: Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Flexible(
//                 // Wrap the Text in a Flexible widget
//                 child: Text(
//                   '$name',
//                   style: TextStyle(color: Colors.white),
//                   overflow: TextOverflow.ellipsis, // Handle overflow
//                 ),
//               ),
//               SizedBox(width: 5),
//               Container(
//                 height: ScreenHeight * 0.03, // Responsive height
//                 width: ScreenWidth * 0.2, // 80% of screen width
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8.0),
//                   border: Border.all(width: 0.4, color: Colors.black),
//                 ),
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4),
//                   child: Text(
//                     'Customer',
//                     style: TextStyle(color: Colors.white, fontSize: 12),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           subtitle: Text(
//             '$flat',
//             style: TextStyle(color: Colors.white),
//           ),
//           leading: CircleAvatar(
//             radius: 20,
//           ),
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(
//               Icons.call,
//               color: Colors.white,
//             ),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 children: [
//                   Icon(Icons.lock),
//                   SizedBox(width: 10.0),
//                   Text(
//                     'Only you and $name can see these entries',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//            Spacer(),
//
//
//             Container(
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Row(
//                 children: [
//                   SizedBox(width: 10.0),
//                   Text(
//                     'Only you and $comp can see these entries',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
//                   ),
//                 ],
//               ),
//             ),
//
//             Text(
//               'Name: $name',
//               style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//             ),
//             // SizedBox(height: 10),
//             // Text(
//             //   'Flat: $flat',
//             //   style: TextStyle(fontSize: 18),
//             // ),
//             // SizedBox(height: 10),
//             // Text(
//             //   'Company: $comp',
//             //   style: TextStyle(fontSize: 18),
//             // ),
//
//             Spacer(),
//             Container(
//               height: 120,
//               width: 350,
//               padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
//               decoration: BoxDecoration(
//                 color: Colors.grey[200],
//                 borderRadius: BorderRadius.circular(8.0),
//               ),
//               child: Column(
//                 children: [
//                   Text(
//                     'Start adding transactions with $name',
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Icon(Icons.arrow_downward_outlined)
//                 ],
//               ),
//             ),
//             SizedBox(height: 16.0),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Container(
//                   height: ScreenHeight * 0.06, // Responsive height
//                   width: ScreenWidth * 0.4, // 80% of screen width
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 0.4,
//                         color: Colors.black,
//                       ),
//                       color: Colors.red),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: 10.0, top: 10.0, bottom: 10, right: 10),
//                     child: InkWell(
//                       onTap: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                                 builder: (context) => Calculatorgave( comp: 'comp', Id: '', billId: '',)));
//                       },
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             maxLines: 1,
//                             'YOU GAVE',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                           Icon(
//                             Icons.currency_rupee,
//                             color: Colors.white,
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Spacer(),
//                 Container(
//                   height: ScreenHeight * 0.06, // Responsive height
//                   width: ScreenWidth * 0.4, // 80% of screen width
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(6),
//                       border: Border.all(
//                         width: 0.4,
//                         color: Colors.black,
//                       ),
//                       color: Colors.green),
//                   child: Padding(
//                     padding: EdgeInsets.only(
//                         left: 10.0, top: 10.0, bottom: 10, right: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         InkWell(
//                           onTap: () {
//                             Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                     builder: (context) => Calculatorgot()));
//                           },
//                           child: Text(
//                             maxLines: 1,
//                             'YOU GOT',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                         ),
//                         Icon(
//                           Icons.currency_rupee,
//                           color: Colors.white,
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
// // // it show the value null
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sgibook/view/you_gave.dart';
import 'package:sgibook/view/you_got.dart';

class CustomerHistory extends StatelessWidget {
  final String name;
  final String flat;
  final String? comp;
  final String? Id;

  CustomerHistory({
    Key? key,
    required this.name,
    required this.flat,
    required this.comp,
    required this.Id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: screenHeight * 0.2,
        flexibleSpace: Stack(
          children: [
            ClipRect(
              // to set our rectangle clip
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '$name',
                              style: TextStyle(color: Colors.white),
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(width: 5),
                            Container(
                              height: screenHeight * 0.03,
                              width: screenWidth * 0.2,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8.0),
                                border: Border.all(width: 0.4, color: Colors.black),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 4.0, bottom: 4.0, right: 4),
                                child: Text(
                                  'Customer',
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
                        ),
                        subtitle: Text(
                          '$flat',
                          style: TextStyle(color: Colors.white),
                        ),
                        leading: CircleAvatar(
                          radius: 20,
                        ),
                        trailing: Icon(Icons.call, color: Colors.white,),
                      ),
                    ),
                  ),
                  // Container(
                  //   decoration: BoxDecoration(
                  //     borderRadius: BorderRadius.circular(6)
                  //   ),
                  // ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 0.4,
                        color: Colors.black,
                      ),
                      color: Colors.white,
                    ),
                    child: Container(
                      height: 50,
                      width: 325,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          color: Colors.white,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('You will give'),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text('Ru.1,000'),
                          ),
                        ],
                      ),
                    )

                  ),

                ],
              ),
            ),
          ],
        ),
        backgroundColor: Color(0xff0752AD),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Icon(Icons.picture_as_pdf),
                    SizedBox(height: 2,),
                    Text('Report'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.add_ic_call),
                    SizedBox(height: 2,),
                    Text('Reminder'),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.message_sharp),
                    SizedBox(height: 2,),
                    Text('SMS'),
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Container(
              height: 420,
              width: 370,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.lock),
                          SizedBox(width: 10.0),
                          Text(
                            maxLines: 2,
                            'Only you and $name can see these entries',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),

                    Container(
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child:
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            maxLines: 1,
                            '25/11/2024. 05:30 PM',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                            textAlign: TextAlign.start,
                          ),
                          Row(
                            children: [
                              Text('Bal. ru 1,000'),Spacer(),Text('Bal. ru 1,000'),
                            ],
                          ),

                          Text('1'),
                        ],
                      ),
                    ),
                    Spacer(),
                    Container(
                      height: 120,
                      width: 450,
                      padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 12.0),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        children: [
                          Text(
                            'Start adding transactions with $name',
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(height: 10),
                          Icon(Icons.arrow_downward_outlined)
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ),





            SizedBox(height: 16.0),


            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 0.4,
                        color: Colors.black,
                      ),
                      color: Colors.red),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 10.0, bottom: 10, right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Calculatorgave(comp: 'comp', Id: 'Id', billId: '',)));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment .center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'YOU GAVE',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Icon(
                            Icons.currency_rupee,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: screenHeight * 0.06,
                  width: screenWidth * 0.4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 0.4,
                        color: Colors.black,
                      ),
                      color: Colors.green),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 10.0, top: 10.0, bottom: 10, right: 10),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Calculatorgot()));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'YOU GOT',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          Icon(
                            Icons.currency_rupee,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}