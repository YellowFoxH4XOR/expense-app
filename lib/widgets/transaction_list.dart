import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function delTx;

  TransactionList(this.transactions, this.delTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text("No Transactions Added"),
                Container(
                  height: 200,
                  child: Image.asset('assets/images/waiting.png',
                      fit: BoxFit.cover),
                ),
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(
                    vertical: 8,
                    horizontal: 5,
                  ),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: EdgeInsets.all(6),
                        child: FittedBox(
                            child: Text(
                          '₹ ${transactions[index].amount}',
                        )),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    subtitle: Text(
                      DateFormat('MMM-dd').format(transactions[index].date),
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).primaryColor,
                      onPressed: () => delTx(transactions[index].id),
                    ),
                  ),
                );
                // return Card(
                //   child: Row(
                //     crossAxisAlignment: CrossAxisAlignment.end,
                //     children: <Widget>[
                //       Container(
                //         padding: EdgeInsets.all(10),
                //         margin: EdgeInsets.symmetric(
                //           vertical: 10,
                //           horizontal: 15,
                //         ),
                //         decoration: BoxDecoration(
                //             border: Border.all(
                //           color: Theme.of(context).primaryColor,
                //           width: 2,
                //         )),
                //         child: Text(
                //           '₹ ${transactions[index].amount}',
                //           style: TextStyle(
                //               fontWeight: FontWeight.bold,
                //               fontSize: 15,
                //               color: Theme.of(context).primaryColor),
                //         ),
                //       ),
                //       Container(
                //         padding: EdgeInsets.all(10),
                //         child: Column(
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: <Widget>[
                //             Text(
                //               transactions[index].title,
                //               style: TextStyle(
                //                 fontWeight: FontWeight.bold,
                //                 fontSize: 15,
                //               ),
                //             ),
                //             Text(
                //               DateFormat('MMM-dd')
                //                   .format(transactions[index].date),
                //               style: TextStyle(color: Colors.grey),
                //             )
                //           ],
                //         ),
                //       )
                //     ],
                //   ),
                // );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
