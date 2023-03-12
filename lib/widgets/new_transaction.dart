import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function callableFunc;

  NewTransaction(this.callableFunc);

  @override
  State<NewTransaction> createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Title'),
              controller: titleController,
            ),
            TextField(
              autofocus: true,
              decoration: InputDecoration(labelText: 'Amount'),
              controller: amountController,
              keyboardType: TextInputType.number,
            ),
            ElevatedButton(
                onPressed: () {
                  widget.callableFunc(titleController.text, double.parse(amountController.text));
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Add Transaction',
                )
            )
          ]),
        ),
      );
  }
}