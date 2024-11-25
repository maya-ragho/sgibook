import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_contacts/flutter_contacts.dart';
import 'package:sgibook/bottom_navigation/bills/nav_more_pay_return.dart';
import 'package:sgibook/bottom_navigation/items/items.dart';
import 'package:sgibook/view/add_party.dart';
import '../view/customer_history.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key,});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchcontroller = TextEditingController();
  String searchText = '';

  final CollectionReference myItems =
      FirebaseFirestore.instance.collection("Book");
  void onSearchChange(String value) {
    setState(() {
      searchText = value;
    });
  }

  late Stream<QuerySnapshot> _stream;
  @override
  void initState() {
    getContactPermission();
    super.initState();
    _fetchUserEmail();
    _stream = FirebaseFirestore.instance
        .collection('Book')
        .orderBy('name')
        .snapshots();
  }

   bool _isLoading = true;

  void _fetchUserEmail() async {
    setState(() {
      _isLoading = true;
    });
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      _isLoading = false;
    });
  }

  // Future<void> openContacts() async {
  //   // Request permission to access contacts
  //   if (await Permission.contacts.request().isGranted) {
  //     // Fetch contacts and handle them as needed
  //     Iterable<Contact> contacts = await ContactsService.getContacts();
  //     // Here, you could navigate to a contacts screen or handle the contacts as needed
  //   } else {
  //     // If permission is denied, you can show a message or handle it accordingly
  //     print("Permission to access contacts was denied");
  //   }
  // }
  List<Contact> contacts = [];
  bool isLoading = true;
  String searchcontactText = '';

  // @override
  // void initState() {
  //   super.initState();
  //   getContactPermission();
  // }
  void getContactPermission() async {
    // Request permissions and fetch contacts if granted
    if (await FlutterContacts.requestPermission()) {
      fetchContacts();
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  void fetchContacts() async {
    // Fetch contacts with properties like phone numbers
    List<Contact> fetchedContacts = await FlutterContacts.getContacts(
      withProperties: true,
    );

    setState(() {
      contacts = fetchedContacts;
      isLoading = false;
    });
  }
  void showAddCustomerBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "Search customer name...",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    searchText = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>AddPartyScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Icon(Icons.add_circle_outline,size: 45,color: Colors.blueAccent,),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text(
                            'Add Customer',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,color: Colors.blueAccent
                            ),
                          ),
                        ),
                      ),
                      Spacer(),
                      Icon(Icons.arrow_forward_ios_rounded,color: Colors.blueAccent,),
                    ],
                  ),
                ),
              ),
              isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    final name = contact.displayName ?? 'No Name';
                    final phoneNumber = contact.phones.isNotEmpty
                        ? contact.phones.first.number
                        : 'No Number';

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(name.isNotEmpty ? name[0] : '?'),
                      ),
                      title: Text(name),
                      subtitle: Text(phoneNumber),
                      onTap: () {
                        // Handle customer selection
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: screenHeight * 0.3,
        flexibleSpace: Stack(
          children: [
            ClipRect(
              // to set our rectangle clip
              child: BackdropFilter(
                  // to set the blur effect
                  filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 40),
                        child: Row(
                          children: [
                            Icon(
                              Icons.book_online_outlined,
                              size: 22,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Priya Jwelars',
                              style: TextStyle(color: Colors.white),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.edit,
                              size: 22,
                              color: Colors.white,
                            ),
                            Spacer(),
                            Container(
                              height: screenHeight * 0.04, // Responsive height
                              width: screenWidth * 0.2, // 80% of screen width
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                border: Border.all(
                                  width: 0.8,
                                  color: Color(0xffFCB122),
                                ),
                                // color: const Color(0xffFA6650),
                              ),
                              child: Text(
                                '10',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16),
                                textAlign: TextAlign.start,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              child: Icon(
                                Icons.calendar_month,
                                size: 22,
                                color: Color.fromRGBO(255, 255, 255, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(
                              'CUSTOMERS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Spacer(),
                            Text(
                              'SUPPLIERS',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 14),
                            ),
                            Spacer(),
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    width: 50,
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        Positioned(
                                          top: 15,
                                          left: 20,
                                          right: 10,
                                          bottom: 15,
                                          child: Icon(
                                            Icons.person,
                                            size: 18,
                                            color: Colors.white,
                                          ),
                                        ),
                                        Positioned(
                                          top: 15,
                                          left: 30,
                                          right: 35,
                                          bottom: 15,
                                          child: Icon(
                                            Icons.add,
                                            size: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    'ADD STAFF',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                              width: 0.4,
                              color: Colors.black,
                            ),
                            color: Colors.white,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Container(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '1,500',
                                          style: TextStyle(
                                              color: Color(0xff138151)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          // 'तुम्ही घ्याल',
                                          'you will give',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          '500',
                                          style: TextStyle(
                                              color: Color(0xffC34055)),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'You will get',
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ],
                                    )),
                                    Spacer(),
                                    Container(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Text(
                                            'View',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          Text(
                                            'Report',
                                            style: TextStyle(
                                                color: Colors.blueAccent),
                                          ),
                                        ])),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Container(
                                        child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                          Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.blueAccent,
                                          )
                                        ])),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  )),
            ),
          ],
        ),
        backgroundColor: Color(0xff0752AD),
      ),
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.interpreter_mode), label: 'Parties'),
          NavigationDestination(
              icon: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Bills()));
                  },
                  child: Icon(Icons.book_rounded)),
              label: 'Bills'),


          InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemsScreen()));
            },
            child: NavigationDestination(
                icon: Icon(Icons.production_quantity_limits), label: 'Items'),
          ),


          NavigationDestination(icon: Icon(Icons.more), label: 'More'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: screenHeight * 0.05, // Responsive height
                  width: screenWidth * 0.5, // 50% of screen width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 0.4,
                      color: Colors.black,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        Icon(Icons.search),
                        SizedBox(
                          width: 5,
                        ),
                        Expanded(
                          child: TextFormField(
                            controller: _searchcontroller,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              border:
                                  InputBorder.none, // Remove the default border
                            ),
                            style:
                                TextStyle(fontSize: 14), // Set the text style
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: screenHeight * 0.05, // Responsive height
                  width: screenWidth * 0.4, // 40% of screen width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      width: 0.4,
                      color: Colors.black,
                    ),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.notification_important_sharp),
                      SizedBox(
                        width: 5,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text(
                          'Bulk Reminder',
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                Container(
                  height: screenHeight * 0.04, // Responsive height
                  width: screenWidth * 0.1, // 80% of screen width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      width: 0.4,
                      color: Colors.black,
                    ),
                    // color: const Color(0xffFA6650),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'All',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>DueDate()));
                  },
                  child: Container(
                    height: screenHeight * 0.04, // Responsive height
                    width: screenWidth * 0.3, // 80% of screen width
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                        width: 0.4,
                        color: Colors.black,
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5, bottom: 5),
                      child: Text(
                        'Due Today',
                        style: TextStyle(color: Colors.black, fontSize: 12),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: screenHeight * 0.04, // Responsive height
                  width: screenWidth * 0.2, // 80% of screen width
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      width: 0.4,
                      color: Colors.black,
                    ),
                    // color: const Color(0xffFA6650),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 5, bottom: 5),
                    child: Text(
                      'Upcoming',
                      style: TextStyle(color: Colors.black, fontSize: 12),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Spacer(),
                Container(
                    child: Column(
                  children: [
                    Icon(
                      Icons.filter_alt_outlined,
                      size: 18,
                    ),
                    Text(
                      'Filters',
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                )),
                Spacer(),
                Container(
                    child: Column(
                  children: [
                    Icon(
                      Icons.picture_as_pdf_outlined,
                      size: 18,
                    ),
                    Text(
                      'PDF',
                      style: TextStyle(fontSize: 8),
                    )
                  ],
                )),
              ],
            ),
            Expanded(
              child: StreamBuilder<QuerySnapshot>(
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text('Some error occurred: ${snapshot.error}'),
                    );
                  }
                  if (snapshot.hasData) {
                    QuerySnapshot querySnapshot = snapshot.data;
                    List<QueryDocumentSnapshot> document = querySnapshot.docs;
                    List<Map> items = document.map((e) => e.data() as Map).toList();

                    // Set<String> uniqueNumbers = {};

                    // Filter the items based on the search text
                    if (searchText.isNotEmpty) {
                      items = items.where((item) {
                        return item['name']
                                .toString()
                                .toLowerCase()
                                .contains(searchText.toLowerCase()) ||
                            item['flat']
                                .toString()
                                .toLowerCase()
                                .contains(searchText.toLowerCase()) ||
                            item['comp']
                                .toString()
                                .toLowerCase()
                                .contains(searchText.toLowerCase());
                      }).toList();
                    }
                     items.sort((a,b)=> a['name'].toString().length.compareTo(b['name'].toString().length));


                    // Use a set to track unique 'num'
                    // Set<String> uniqueNumbers = {};
                    // List<Map> uniqueItems = [];


                    // Filter out duplicates based on 'क्रमांक'
                    // for (var item in items) {
                    //   String number = item['mobile'].toString();
                    //   if (!uniqueNumbers.contains(number)) {
                    //     uniqueNumbers.add(number);
                    //     uniqueItems.add(item);
                    //   }
                    // }
                    // Sort unique items based on the length of the 'क्रमांक' field if needed
                    // uniqueItems.sort((a, b) => a['mobile']
                    //     .toString()
                    //     .length
                    //     .compareTo(b['mobile'].toString().length));

                    return ListView.builder(
                        // itemCount: uniqueItems.length,
                         itemCount: items.length,
                        itemBuilder: (BuildContext context, int index) {
                          Map thisItem = items[index];
                          // Map thisItem = uniqueItems[index];

                          return Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Material(
                                elevation: 4,
                                borderRadius: BorderRadius.circular(20),
                                child: ListTile(
                                  title: Text('${thisItem['name']}'),
                                  subtitle: Text('${thisItem['flat']}'),
                                  trailing: Text('${thisItem['comp']}'),
                                  leading: CircleAvatar(
                                    radius: 25,
                                    child: thisItem.containsKey('image')
                                        ? ClipOval(
                                            child: Image.network(
                                              "${thisItem['image']}",
                                              fit: BoxFit.cover,
                                              height: 70,
                                              width: 70,
                                            ),
                                          )
                                        : CircleAvatar(
                                            radius: 27,
                                            child: Icon(Icons.person),
                                          ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => CustomerHistory(
                                          name: thisItem['name'],
                                          flat: thisItem['flat'],
                                          comp: thisItem['comp'],
                                          Id: thisItem['Id'],

                                          // image: thisItem.containsKey('image') ? thisItem['image'] : '', // Handle case where image might not exist
                                        ),
                                      ),
                                    );
                                  },
                                )),
                          );
                        });
                  }
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                },
                stream: _stream,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 160.0, right: 5),
              child: Container(
                height: screenHeight * 0.05, // Responsive height
                width: screenWidth * 0.4, // 80% of screen width
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(
                      width: 0.4,
                      color: Colors.black,
                    ),
                    color: Color(0xffA5084B)),
                child: Padding(

                  padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.add,
                        size: 14,
                        color: Colors.white,
                      ),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 14,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap: () {
                          showAddCustomerBottomSheet(context);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) => AddCustomerBottomSheet()));
                        },
                        child: Text(
                          'ADD CUSTOMER',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
