import 'package:intl/intl.dart';

import '../models/transaction.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatefulWidget {
  const TransactionItem({
    Key key,
    this.transaction,
    this.removeTransaction,
  }): super(key : key);

  final Transaction transaction;
  final Function removeTransaction;

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).primaryColor,
        maxRadius: 30.0,
        child: FittedBox(
          child: Text(
            '\$${widget.transaction.price.toStringAsFixed(1)}',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      title: Text(widget.transaction.title),
      subtitle: Text(
        DateFormat.yMMMd().format(widget.transaction.date),
      ),
      trailing: IconButton(
        onPressed: () {
          widget.removeTransaction(widget.transaction.id);
          Scaffold.of(context).showSnackBar(
            SnackBar(
              duration: Duration(seconds: 1),
              content: Text('Item ${widget.transaction.title} Deleted',textAlign: TextAlign.center,),
            ),
          );
        },
        icon: Icon(
          Icons.delete,
          color: Theme.of(context).errorColor,
        ),
      ),
    );
  }
}