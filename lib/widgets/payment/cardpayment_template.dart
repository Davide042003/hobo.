import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPayment {
  final String name;
  final int lastNumber;
  final int cvv;
  final String expiration;
  final String type;

  CardPayment({this.name, this.lastNumber, this.cvv, this.expiration, this.type});
}

final cardPaymentArrayList = [
  CardPayment(name: "Jessie Williams",lastNumber: 1235, cvv: 123, expiration: "05/22", type: "Mastercard"),
  CardPayment(name: "Davide De Blasio",lastNumber: 2356, cvv: 987, expiration: "03/25", type: "Visa"),
];
