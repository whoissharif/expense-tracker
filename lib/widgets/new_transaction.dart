import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addTx;
  const NewTransaction(this.addTx);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime _selectedDate;

  void _submitData() {
    final enteredTitle = _titleController.text;
    final enteredAmount = double.parse(_amountController.text);
    if (enteredTitle.isEmpty || enteredAmount <= 0 || _selectedDate == null) {
      return;
    }
    widget.addTx(
      _titleController.text,
      double.parse(_amountController.text),
      _selectedDate,
    );
    Navigator.pop(context);
  }

  void _chooseDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2018),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value == null) {
        return;
      }
      setState(() {
        _selectedDate = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 25.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          TextField(
            controller: _titleController,
            decoration: InputDecoration(labelText: 'Title'),
            onSubmitted: (_) => _submitData,
          ),
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Amount'),
            onSubmitted: (_) => _submitData,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                _selectedDate == null
                    ? 'No Date Choosen'
                    : DateFormat.yMMMd().format(_selectedDate),
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).accentColor
                ),
              ),
              FlatButton(
                textColor: Theme.of(context).buttonColor,
                padding: EdgeInsets.all(0),
                child: Text(
                  'Choose Date',
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                  ),
                ),
                // textColor: Colors.blueAccent,
                onPressed: _chooseDate,
              )
            ],
          ),
          FlatButton(
            color: Theme.of(context).buttonColor,
            onPressed: _submitData,
            child: Text(
              'Add Transaction',
              style: TextStyle(color: Colors.white),
            ),
            // color: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}
