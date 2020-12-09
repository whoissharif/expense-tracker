import 'package:flutter/material.dart';
import '../widgets/noTransactionAdded.dart';
import '../widgets/transaction_list.dart';
import '../models/transaction.dart';
import '../widgets/new_transaction.dart';
import '../widgets/chart.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final List<Transaction> _transactionList = [];

  void _addTransaction(String title, double amount, DateTime date) {
    final newTx = Transaction(
      title,
      amount,
      DateTime.now().toString(),
      date,
    );
    setState(() {
      _transactionList.add(newTx);
    });
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactionList.removeWhere((t) => t.id == id);
    });
  }

  void openBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (c) {
          return NewTransaction(_addTransaction);
        });
  }

  List<Transaction> get _recentTransactions {
    return _transactionList.where((tx) {
      return tx.date.isAfter(
        DateTime.now().subtract(
          Duration(days: 7),
        ),
      );
    }).toList();
  }

  // void showSnack(BuildContext context) {
  //   Scaffold.of(context).showSnackBar(
  //     SnackBar(
  //       content: Text('Deleted'),
  //       backgroundColor: Colors.blueAccent,
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final PreferredSizeWidget appbar = AppBar(
      title: Text('Expense Planner'),
    );
    return Scaffold(
      appBar: appbar,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _transactionList.isEmpty
                ? Container()
                : Container(
                    height: (mediaQuery.size.height -
                            mediaQuery.padding.top -
                            appbar.preferredSize.height) *
                        0.3,
                    child: Chart(_recentTransactions),
                  ),
            _transactionList.isEmpty
                ? Column(
                    children: <Widget>[
                      Container(
                        height: mediaQuery.size.height,
                        child: NoTransactionAdded(
                          openSheet: openBottomSheet,
                        ),
                      ),
                    ],
                  )
                : Container(
                    height: (mediaQuery.size.height -
                            mediaQuery.padding.top -
                            appbar.preferredSize.height) *
                        0.7,
                    child: TransactionList(
                        transactionList: _transactionList,
                        removeTransaction: _deleteTransaction),
                  )
          ],
        ),
      ),
      floatingActionButton: _transactionList.isEmpty
          ? Container()
          : FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {
                openBottomSheet(context);
              }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
