import 'package:cloud_firestore/cloud_firestore.dart';

class FSDBService {
  static final databaseReference = FirebaseFirestore.instance;

  /// insert && update && delete
  static Future<void> insertData(Students data) async {
    await databaseReference
        .collection("Student")
        .doc(data.id.toString())
        .set(data.toMap())
        .catchError((error) => print("Failed to add user: $error"));
  }

  static Future<void> updateData(Students data) async {
    await databaseReference.collection("Student").doc('111').update(data.toMap());
  }

  static Future deleteData(String userId) async {
    await FirebaseFirestore.instance.collection("Student").doc('111').delete();
  }

  /// get data at once
  static Future<void> getAllData() async {
    await databaseReference.collection("Student").get().then((QuerySnapshot<Map<String, dynamic>> value) {
      value.docs.forEach((element) {
        print('getUser: ${element.data()}');
      });
    });
  }

  static Future<void> getUserBaseData() async {
    await databaseReference.collection("Student").doc('112').get().then((value) {
      print('getUser: ${value.data().toString()}');
    });
  }

  /// stream for get data with any changes
  static Future<void> streamForGetAllData() async {
    Stream collectionStream = FirebaseFirestore.instance.collection('Student').snapshots();
    collectionStream.listen((event) {
      print('getUser event: ${event.data().toString()}');
    });
  }

  static Future<void> streamForGetUserBaseData() async {
    Stream documentStream = FirebaseFirestore.instance.collection('Student').doc('111').snapshots();
    documentStream.listen((event) {
      print('getUser event: ${event.data().toString()}');
    });
  }

  /// get data with Filter
  static Future<void> getDataWithFilter() async {
    await databaseReference.collection("Student").where("age", isEqualTo: 25).get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          print('getUser: ${element.data().toString()}');
        });
      }
    });
  }

  static Future<void> getDataWithSortNLimit() async {
    databaseReference.collection('Student').orderBy('age').limitToLast(2).get().then((value) {
      if (value.docs.isNotEmpty) {
        value.docs.forEach((element) {
          print('getUser: ${element.data().toString()}');
        });
      }
    });
  }

  static Future<void> addDataInSpecificField() async {
    /// collection >> document >>  field  ( StudentList ni andar add thay )
    databaseReference.collection('Quotation').doc('data').update({
      "StudentList": FieldValue.arrayUnion([
        {
          'name': 'name',
          "email": 'test@gmail.com',
        }
      ])
    });
  }
}

class Students {
  final int id, age;
  final String name, city;

  Students({
    required this.city,
    required this.name,
    required this.id,
    required this.age,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': this.id,
      'age': this.age,
      'name': this.name,
      'city': this.city,
    };
  }
}
