import 'dart:core';

class Transaction {
  final String title;
  final double price;
  final String id;
  final DateTime date;

  Transaction(
    this.title,
    this.price,
    this.id,
    this.date,
  );
}
