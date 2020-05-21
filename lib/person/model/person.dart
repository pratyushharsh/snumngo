import 'address.dart';

class Person {
  final String sno;
  final String name;
  final String mobile;
  final String whatsapp;
  final String gender;
  final DateTime dob;
  final Address address;
  final String occupation;
  final String aadhaar;
  final List<String> aadharUrl;
  final String pancard;
  final String pancardUrl;
  final String voterId;
  final List<String> voterUrl;

  Person(
      this.sno,
      this.name,
      this.mobile,
      this.whatsapp,
      this.gender,
      this.dob,
      this.address,
      this.occupation,
      this.aadhaar,
      this.aadharUrl,
      this.pancard,
      this.pancardUrl,
      this.voterId,
      this.voterUrl);
}
