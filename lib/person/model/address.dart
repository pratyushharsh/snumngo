import 'package:flutter/foundation.dart';

@immutable
class Address {
  final String houseNo;
  final String street;
  final String city;
  final String ward;
  final String municipal;
  final String district;
  final String pincode;
  final String state;

  Address(this.houseNo, this.street, this.city, this.ward, this.municipal,
      this.district, this.pincode, this.state);
}
