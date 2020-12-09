import 'package:flutter/material.dart';

class NoTransactionAdded extends StatelessWidget {
 final Function openSheet;
 NoTransactionAdded({this.openSheet});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'No transaction added !',
          style: TextStyle(fontSize: 20,),
        ),
        Text(
          'Add a new one',
          style: TextStyle(fontSize: 20,),
        ),
        SizedBox(height: 50),
        IconButton(
          onPressed: () {
            openSheet(context);
          },
          icon: Icon(
            Icons.add_to_photos,
          ),
          iconSize: 50,
          // color: Theme.of(context).accentColor,
        ),
      ],
    );
  }
}