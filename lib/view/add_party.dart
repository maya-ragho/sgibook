import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_string/random_string.dart';
import 'package:sgibook/services/database.dart';
import 'package:sgibook/view/add_customer.dart';
import 'package:sgibook/home/home_page.dart';

class AddPartyScreen extends StatefulWidget {
  const AddPartyScreen({super.key});

  @override
  State<AddPartyScreen> createState() => _AddPartyScreenState();
}

class _AddPartyScreenState extends State<AddPartyScreen> {
  final _formKey = GlobalKey<FormState>();

  String? _selectedOption = 'Customer';
  bool ischecked = false;
  bool showAdditionalFields = false;

  TextEditingController namecontroller = TextEditingController();
  TextEditingController mobilecontroller = TextEditingController();
  TextEditingController flatcontroller = TextEditingController();
  TextEditingController areacontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0752AD),
        title: Row(
          children: [
            Text(
              'Add Party',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: namecontroller,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(
                      color: Color(0xFF666666),
                    ),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: BorderSide(
                        color: Colors.grey.shade400,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6.0),
                      borderSide: const BorderSide(
                          color: Color(0xffFA6650), width: 1.0),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 6, right: 8, top: 10),
                child: Row(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 60,
                          height: 50, // Set desired width here
                          child: TextFormField(
                            controller: mobilecontroller,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(
                                color: Color(0xFF666666),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 6.0,
                                  horizontal: 8.0), // Adjust padding for height
                              prefixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Row(
                                  children: [
                                    Image.asset(
                                      'assets/img.png',
                                      height: 14,
                                      width: 14,
                                    ),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Text('+91',
                                        style: TextStyle(
                                            color: Color(0xFF666666))),
                                  ],
                                ),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: Color(0xffFA6650),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: 260,
                      height: 50, // Set desired width here
                      child: TextFormField(
                        controller: mobilecontroller,
                        decoration: InputDecoration(
                          hintText: 'Mobile Number',
                          hintStyle: TextStyle(
                            color: Color(0xFF666666),
                          ),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 14.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: BorderSide(
                              color: Colors.grey.shade400,
                              width: 1.0,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                            borderSide: const BorderSide(
                                color: Color(0xffFA6650), width: 1.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    'Who are they?',
                    style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                  ),
                  Radio<String>(
                    value: 'Customer',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                  ),
                  Text("Customer"),
                  Radio<String>(
                    value: 'Supplier',
                    groupValue: _selectedOption,
                    onChanged: (value) {
                      setState(() {
                        _selectedOption = value;
                      });
                    },
                  ),
                  Text("Supplier"),
                ],
              ),
              GestureDetector(
                onTap: (){
                  setState(() {
                    showAdditionalFields = !showAdditionalFields;
                  });
                },
                child: Row(
                  children: [
                    Icon(
                      showAdditionalFields ? Icons.remove : Icons.add,
                      color: Colors.blueAccent,
                    ),
                    Text(
                      'ADD GSTIN & ADDRESS(OPTIONAL)',
                      style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                    )
                  ],
                ),
              ),
              if(showAdditionalFields)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'GSTIN',
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 14.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: const BorderSide(
                              color: Color(0xffFA6650), width: 1.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: flatcontroller,
                      decoration: InputDecoration(
                        hintText: 'Flat / Building Number',
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 14.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: const BorderSide(
                              color: Color(0xffFA6650), width: 1.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: areacontroller,
                      decoration: InputDecoration(
                        hintText: 'Area / Locality',
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 14.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(6.0),
                          borderSide: const BorderSide(
                              color: Color(0xffFA6650), width: 1.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: pincontroller,
                      decoration: InputDecoration(
                        hintText: 'Pincode',
                        hintStyle: TextStyle(
                          color: Color(0xFF666666),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 14.0),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(4.0),
                          borderSide: BorderSide(
                            color: Colors.grey.shade400,
                            width: 1.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          borderSide: const BorderSide(
                              color: Color(0xffFA6650), width: 1.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 150,
                          height: 50, // Set desired width here
                          child: TextFormField(
                            controller: citycontroller,
                            decoration: InputDecoration(
                              hintText: 'City',
                              hintStyle: TextStyle(
                                color: Color(0xFF666666),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal:
                                      12.0), // Adjust padding for height
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: Color(0xffFA6650),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        ),
                        Spacer(),
                        Container(
                          width: 150,
                          height: 50, // Set desired width here
                          child: TextFormField(
                            controller: statecontroller,
                            decoration: InputDecoration(
                              hintText: 'State',
                              hintStyle: TextStyle(
                                color: Color(0xFF666666),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 8.0,
                                  horizontal:
                                      12.0), // Adjust padding for height
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade400,
                                  width: 1.0,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: const BorderSide(
                                  color: Color(0xffFA6650),
                                  width: 1.0,
                                ),
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: ischecked,
                            onChanged: (bool? newValue) {
                              setState(() {
                                ischecked = newValue!;
                              });
                            }),
                        Text(
                          'Shipping address same as billing address?',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(bottom: 4.0, left: 8.0, right: 8.0, top: 4.0),
                child: Container(
                  height: screenHeight * 0.06, // Responsive height
                  width: screenWidth * 1, // 80% of screen width
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(
                        width: 0.2,
                        color: Colors.grey,
                      ),
                      color: Colors.blueAccent),
                  child: Center(
                    child: InkWell(
                      onTap: () async {
                        if (_formKey.currentState!.validate()) {
                          String Id = randomAlphaNumeric(10);
                          Map<String, dynamic> billInfoMap = {
                            "name": namecontroller.text,
                            "mobile": mobilecontroller.text,
                            "flat": flatcontroller.text,
                            "area": areacontroller.text,
                            "pin": pincontroller.text,
                            "city": citycontroller.text,
                            "state": statecontroller.text,
                            "Id": Id,
                          };
                          await DatabaseMethods()
                              .addPartyDetails(billInfoMap, Id)
                              .then((value) {
                            Fluttertoast.showToast(
                                msg:
                                    "Bill Details has been uploaded successfully",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0);
                          });
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => HomePage()));

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePage()));
                        }

                        namecontroller.clear();
                        flatcontroller.clear();
                        areacontroller.clear();
                        pincontroller.clear();
                        citycontroller.clear();
                        statecontroller.clear();
                      },
                      child: Text(
                        'ADD CUSTOMER',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:random_string/random_string.dart';
// import 'package:sgibook/services/database.dart';
//
// import 'customer_history.dart';
//
// class AddPartyScreen extends StatefulWidget {
//   const AddPartyScreen({super.key});
//
//   @override
//   State<AddPartyScreen> createState() => _AddPartyScreenState();
// }
//
// class _AddPartyScreenState extends State<AddPartyScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   String? _selectedOption = 'Customer';
//   TextEditingController namecontroller = TextEditingController();
//   TextEditingController mobileController = TextEditingController();
//   TextEditingController flatcontroller = TextEditingController();
//   TextEditingController areacontroller = TextEditingController();
//   TextEditingController pincontroller = TextEditingController();
//   TextEditingController citycontroller = TextEditingController();
//   TextEditingController statecontroller = TextEditingController();
//   final compController = TextEditingController();
//
//
//   @override
//   Widget build(BuildContext context) {
//     final ScreenHeight= MediaQuery.of(context).size.width;
//     final ScreenWidth = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xff0752AD),
//         title: Text('Add Party', style: TextStyle(color: Colors.white)),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               children: [
//                 SizedBox(height: 10),
//                 TextField(
//                   controller: namecontroller,
//                   decoration: InputDecoration(
//                     labelText: 'Party name',
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16.0),
//                 Row(
//                   children: [
//                     Container(
//                       width: 80,
//                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                       decoration: BoxDecoration(
//                         border: Border.all(color: Colors.black54),
//                         borderRadius: BorderRadius.circular(5.0),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: const [
//                           Text("IN",style: TextStyle(fontSize: 15),),
//                           Text('+91'),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 8.0),
//                     Expanded(
//                       child: TextField(
//                         controller: mobileController,
//                         keyboardType: TextInputType.phone,
//                         decoration: InputDecoration(
//                           labelText: 'Mobile Number',
//                           border: OutlineInputBorder(),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 20),
//                 Row(
//                   children: [
//                     Text(
//                       'Who are they?',
//                       style: TextStyle(color: Color(0xFF666666), fontSize: 16),
//                     ),
//                     Radio<String>(
//                       value: 'Customer',
//                       groupValue: _selectedOption,
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedOption = value;
//                         });
//                       },
//                     ),
//                     Text("Customer"),
//                     Radio<String>(
//                       value: 'Supplier',
//                       groupValue: _selectedOption,
//                       onChanged: (value) {
//                         setState(() {
//                           _selectedOption = value;
//                         });
//                       },
//                     ),
//                     Text("Supplier"),
//                   ],
//                 ),
//                 Row(
//                   children: [
//                     Icon(Icons.add, color: Colors.blueAccent),
//                     Text(
//                       'ADD GSTIN & ADDRESS (OPTIONAL)',
//                       style: TextStyle(fontSize: 14, color: Colors.blueAccent),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: flatcontroller,
//                   decoration: InputDecoration(
//                     hintText: 'Flat / Building Number',
//                     hintStyle: TextStyle(color: Color(0xFF666666)),
//                     contentPadding:
//                     EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade400,
//                         width: 1.0,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: const BorderSide(
//                           color: Color(0xffFA6650), width: 1.0),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: areacontroller,
//                   decoration: InputDecoration(
//                     hintText: 'Area / Locality',
//                     hintStyle: TextStyle(color: Color(0xFF666666)),
//                     contentPadding:
//                     EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade400,
//                         width: 1.0,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: const BorderSide(
//                           color: Color(0xffFA6650), width: 1.0),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: pincontroller,
//                   decoration: InputDecoration(
//                     hintText: 'Pin',
//                     hintStyle: TextStyle(color: Color(0xFF666666)),
//                     contentPadding:
//                     EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade400,
//                         width: 1.0,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: const BorderSide(
//                           color: Color(0xffFA6650), width: 1.0),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: citycontroller,
//                   decoration: InputDecoration(
//                     hintText: 'City',
//                     hintStyle: TextStyle(color: Color(0xFF666666)),
//                     contentPadding:
//                     EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade400,
//                         width: 1.0,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: const BorderSide(
//                           color: Color(0xffFA6650), width: 1.0),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10),
//                 TextFormField(
//                   controller: statecontroller,
//                   decoration: InputDecoration(
//                     hintText: 'State',
//                     hintStyle: TextStyle(color: Color(0xFF666666)),
//                     contentPadding:
//                     EdgeInsets.symmetric(vertical: 8.0, horizontal: 14.0),
//                     enabledBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: BorderSide(
//                         color: Colors.grey.shade400,
//                         width: 1.0,
//                       ),
//                     ),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(6.0),
//                       borderSide: const BorderSide(
//                           color: Color(0xffFA6650), width: 1.0),
//                     ),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) {
//                       return 'Please enter some text';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 10,),
//
//                 Padding(
//                   padding: EdgeInsets.only(bottom: 2.0, left: 8.0, right: 8.0),
//                   child: Container(
//                     height: ScreenHeight * 0.1, // Responsive height
//                     width: ScreenWidth * 1, // 80% of screen width
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(6),
//                         border: Border.all(
//                           width: 0.2,
//                           color: Colors.grey,
//                         ),
//                         color: Colors.blueAccent),
//                     child: Center(
//                       child: InkWell(
//                         onTap: () async {
//                           if(_formKey.currentState!.validate()){
//                             String Id = randomAlphaNumeric(10);
//                             Map<String, dynamic> billInfoMap = {
//                               "name": namecontroller.text,
//                               // "mobile":mobilecontroller.text,
//                               "flat":flatcontroller.text,
//                               "area":areacontroller.text,
//                               "pin":pincontroller.text,
//                               "city":citycontroller.text,
//                               "state":statecontroller.text,
//                                "Id":Id,
//                             };
//                             await DatabaseMethods()
//                                 .addPartyDetails(billInfoMap, Id)
//                                 .then((value) {
//                               Fluttertoast.showToast(
//                                   msg:
//                                   "Add Party Details has been uploaded successfully",
//                                   toastLength: Toast.LENGTH_SHORT,
//                                   gravity: ToastGravity.CENTER,
//                                   timeInSecForIosWeb: 1,
//                                   backgroundColor: Colors.red,
//                                   textColor: Colors.white,
//                                   fontSize: 16.0);
//                             });
//                             // Navigator.push(context,MaterialPageRoute(builder: (context) => Calculatorgave(Id:Id,)));
//                             //   Navigator.push(context,MaterialPageRoute(builder: (context) => HomePage()));
//
//
//
//                                // Navigator.push(context, MaterialPageRoute(builder: (context)=>Calculatorgave(comp: 'comp' )));
//                               Navigator.pop(context, MaterialPageRoute(builder: (context)=>CustomerHistory( name: 'name', flat: 'flat', comp: 'comp', Id: 'Id' )));
//                            }
//                           // Navigator.push(context,
//                           //       MaterialPageRoute(builder: (context) => HomePage(billId: '',)));
//                           // }
//
//                           namecontroller.clear();
//                           flatcontroller.clear();
//                           areacontroller.clear();
//                           pincontroller.clear();
//                           citycontroller.clear();
//                           statecontroller.clear();
//                         },
//                         child: Text(
//                           'ADD CUSTOMER',
//                           style: TextStyle(color: Colors.white, fontSize: 16),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
