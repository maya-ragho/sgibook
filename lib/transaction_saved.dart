import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sgibook/view/add_customer.dart';
import 'package:sgibook/view/customer_history.dart';
import 'package:sgibook/home/home_page.dart';
import 'package:sgibook/view/you_gave.dart';
import 'package:sgibook/view/you_got.dart';


class TransactionSaved extends StatefulWidget {
  const TransactionSaved({super.key, required String Id});

  @override
  State<TransactionSaved> createState() => _TransactionSavedState();
}

class _TransactionSavedState extends State<TransactionSaved> {
  @override
  Widget build(BuildContext context) {
    final ScreenHeight = MediaQuery.of(context).size.height;
    final ScreenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: ScreenHeight * 0.3,
        flexibleSpace: Stack(
          children: [
            ClipRect(
              // to set our rectangle clip
              child: BackdropFilter(
                // to set the blur effect
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Column(
                    children: [
                    ],
                  )),
            ),
          ],
        ),
        backgroundColor: Color(0xff0752AD),
      ),

      body: Column(
        children: [
Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CustomerHistory(name: 'name', flat: 'flat', comp: 'comp', Id: '',)));
                },
                child: Container(
                  height: ScreenHeight * 0.06, // Responsive height
                  width: ScreenWidth * 0.4, // 80% of screen width
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          maxLines: 1,
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
              InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Calculatorgot()));
                },
                child: Container(
                  height: ScreenHeight * 0.06, // Responsive height
                  width: ScreenWidth * 0.4, // 80% of screen width
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
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          maxLines: 1,
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
          ),
          Spacer(),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
            },
            child: Container(
              height: ScreenHeight * 0.06, // Responsive height
              width: ScreenWidth * 0.4, // 80% of screen width
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      maxLines: 1,
                      'DONE',
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
      ),    );
  }
}
