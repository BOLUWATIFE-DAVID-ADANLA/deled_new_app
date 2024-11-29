import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class FirestoreService {
  final _firestore = FirebaseFirestore.instance;

  Future<void> addtasks(Map<String, dynamic> tasks) async {
    try {
      await _firestore.collection('tasks').add(tasks);
    } catch (e) {
      debugPrint(e.toString());
      throw 'there was an error adding your tasks';
    }
  }

  Future<void> removetasks(String id) async {
    try {
      await _firestore.collection('tasks').doc(id).delete();
    } catch (e) {
      debugPrint(e.toString() + 'bolu there is an error');
      throw 'there was an error deleting your tasks';
    }
  }
}
