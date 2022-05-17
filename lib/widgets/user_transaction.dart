import 'package:flutter/material.dart';
import '/widgets/transaction_list.dart';
import '/widgets/new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  const UserTransaction({Key? key}) : super(key: key);

  @override
  State<UserTransaction> createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _userTransactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 999, date: DateTime.now()),
    Transaction(id: 't2', title: 'new jean', amount: 89, date: DateTime.now()),
  ];

  void addNewTransaction(String txTitle, double txAmount){
    final newTx= Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());
    setState(() {
      _userTransactions.add(newTx);
    });

  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewTransaction(),
        TransactionList(transactions: _userTransactions),
      ],
    );
  }
}
