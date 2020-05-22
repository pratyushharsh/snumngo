import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:snumngo/person/model/models.dart';
import './bloc.dart';

class PersonBloc extends Bloc<PersonEvent, PersonState> {

  Person person = Person(personalInfo: PersonalInfo(), address: Address(), occupation: Occupation());

  updateAddress(Address address) {
    person = person.copyWith(address: address);
  }

  updatePersonalInfo(PersonalInfo personalInfo) {
    person = person.copyWith(personalInfo: personalInfo);

  }

  updateOccupation(Occupation occupation) {
    person = person.copyWith(occupation: occupation);
  }

  @override
  PersonState get initialState => InitialPersonState();

  @override
  Stream<PersonState> mapEventToState(
    PersonEvent event,
  ) async* {
    if (event is UpdateSno) {
       updatePersonalInfo(person.personalInfo.copyWith(sno: event.sno));
       yield InitialPersonState();
    }
  }
}
