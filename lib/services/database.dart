import 'package:cloud_firestore/cloud_firestore.dart';
class DatabaseMethods{
  Future addPartyDetails(
    Map<String, dynamic>partyinfoMap, String id)async{
    return await FirebaseFirestore.instance
        .collection('Book') //collection name
        .doc(id)
        .set(partyinfoMap);//upload user Map data
  }
  Future<Stream<QuerySnapshot>> getPartyDetails()async{
    return await FirebaseFirestore.instance.collection('Book').snapshots();
  }

  Future saveupdatePartyDetails(String id, Map<String, dynamic>updateInfo)async{
    return await FirebaseFirestore.instance.collection('Book').doc(id).update(updateInfo);
  }

  //
  // Future saveupdateBillDetails(String id, Map<String, dynamic> updateInfo)async{
  //   return await FirebaseFirestore.instance.collection('Bill').doc(id).update(updateInfo);
  // }
  //
  // Future UpdateInvoiceBill(String id, Map<String, dynamic> updateInfo)async{
  //   return await FirebaseFirestore.instance.collection('Bill').doc(id).update(updateInfo);
  // }
  //  Future deleteBillDetails(String id)async{
  //   return await FirebaseFirestore.instance.collection('Bill').doc(id).delete();
  // }

}


