import 'package:snumngo/person/model/models.dart';

class WorkersRepository {
  List<Person> _persons = List<Person>();

  addPerson(Person p) {
    _persons.add(p);
    return p;
  }

  List<Person> getAllWorker() {
    return _persons;
  }

  Person getWorker(String id) {
    return _persons.firstWhere((element) => element.personalInfo.sno.compareTo(id) == 0);
  }
}