import 'package:expenseapp/widgets/new_transaction.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';
import 'widgets/new_transaction.dart';
import 'widgets/transaction_list.dart';
import 'widgets/chart.dart';
// import '././';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: HomePage(),
      theme: ThemeData(
        fontFamily: 'OpenSans',
        primarySwatch: Colors.purple
      ),
    );
  }
}

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void _startAddTransaction(BuildContext ctx) {
    showModalBottomSheet(context: ctx, builder: (bCtx) {
      return GestureDetector(
        onTap: () {},
        behavior: HitTestBehavior.opaque,
        child: NewTransaction(_addTransaction));
    },);
  }
  final List<Transaction> _transactions = [
    // Transaction(
    //   id: 't1',
    //   title: 'New Shoes',
    //   amount: 70,
    //   date: DateTime.now(),
    // ),
    // Transaction(
    //   id: 't2',
    //   title: 'Weekly-Shop',
    //   amount: 30,
    //   date: DateTime.now(),
    // ),
  ];

  List<Transaction> get _recentTx {
    return _transactions.where((element) {
      return element.date.isAfter(DateTime.now().subtract(Duration(days: 7),));
    }).toList();
  }

  void _addTransaction(String title, double amount) {
    final newTxt = Transaction(id: DateTime.now().toString(), amount: amount, date: DateTime.now(), title: title,);
    setState(() {
      _transactions.add(newTxt);
    });
  }

   void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((element) {
          return element.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expense Tracker'),
          actions: <Widget>[
            IconButton(onPressed: () => _startAddTransaction(context), icon: Icon(Icons.add))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Chart(_recentTx),
              TransactionList(_transactions, _deleteTransaction),
            ],
            
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () => _startAddTransaction(context),
        ),
      );
  }
}
