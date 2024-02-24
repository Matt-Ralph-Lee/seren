import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:firebase_database/firebase_database.dart';

class Database {
  static final realtimeDatabaes = FirebaseDatabase.instance.ref();
  static final storage = FirebaseStorage.instance.ref();
  static final firestore = FirebaseFirestore.instance;
}
