import 'package:flutter/material.dart';

import '../models/transaction.dart';
import '../widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactionList;
  final Function removeTransaction;

  TransactionList({this.transactionList, this.removeTransaction});

  @override
  Widget build(BuildContext context) {
    return ListView(
      // .builder(
      //   itemCount: transactionList.length,
      //   itemBuilder: (context, index)
      children: transactionList
          .map((tx) => TransactionItem(
                key: ValueKey(tx.id),
                transaction: tx,
                removeTransaction: removeTransaction,
              ))
          .toList(),
    );
  }
}