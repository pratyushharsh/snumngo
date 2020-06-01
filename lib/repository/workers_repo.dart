import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snumngo/person/model/models.dart';

class WorkersRepository {

  final Firestore _db;

  WorkersRepository({Firestore db})
  : _db = db ?? Firestore.instance;

  Future<void> addNewWorker(Worker p) {
    return _db.collection('/workers').add(p.toDocument());
  }

  Future<void> updateWorker(Worker p) {
    return _db.collection('/workers').document(p.uuid).updateData(p.toDocument());
  }

  Future<void> deleteWorker(Worker p) {
    return _db.collection('/workers').document(p.uuid).delete();
  }

  Stream<List<Worker>> getAllWorker() {
    return _db.collection('/workers').snapshots().map((snapshot) {
      return snapshot.documents.map((doc) => Worker.fromSnapshot(doc)).toList();
    });
  }
}