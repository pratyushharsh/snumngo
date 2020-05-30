import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:snumngo/person/model/models.dart';

class WorkersRepository {

  final Firestore _db;

  WorkersRepository({Firestore db})
  : _db = db ?? Firestore.instance;
  
  Stream getAllUser() {
    _db.collection('/users').snapshots().map((doc) => {
      print(doc)
    });
  }
  
  List<Person> _persons = List<Person>();

  addPerson(Person p) {
    _persons.add(p);
    return p;
  }

  Future<void> addNewWorker(Person p) {
    return _db.collection('/workers').add(p.toDocument());
  }

  List<Person> getAllWorker() {
    return _persons;
  }

  Person getWorker(String id) {
    return _persons.firstWhere((element) => element.personalInfo.sno.compareTo(id) == 0);
  }
}