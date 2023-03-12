import 'package:flutter/foundation.dart';


class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;

  Transaction({
    @required this.id='None',
    @required this.amount=0,
    @required DateTime? date,
    @required this.title='None',
  })
  : this.date = date ?? DateTime.now();
    
  
}
