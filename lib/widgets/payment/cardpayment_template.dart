import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CardPayment {
  final String name;
  final int cvv;
  final String expiration;
  final String type;

  CardPayment({this.name, this.cvv, this.expiration, this.type});
}

final cardPaymentArrayList = [
  CardPayment(name: "Paris", cvv: 123, expiration: "05/22", type: "Mastercard"),
  CardPayment(name: "Paris", cvv: 123, expiration: "05/22", type: "Mastercard"),
];
