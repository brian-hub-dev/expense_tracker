import 'package:flutter/material.dart';
import '/transaction.dart';

class MyHomePage extends StatelessWidget {
  final List<Transaction> transactions = [
    Transaction(
        id: 't1', title: 'new shoes', amount: 999, date: DateTime.now()),
    Transaction(id: 't2', title: 'new jean', amount: 89, date: DateTime.now()),
    Transaction(
        id: 't3', title: 'new grocery', amount: 345, date: DateTime.now()),
    Transaction(
        id: 't4', title: 'new jacket', amount: 454, date: DateTime.now())
  ];

  // MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> getList() {
      List<Widget> childs = transactions
          .map(
            (tx) => Row(
              children: <Widget>[
                Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2),
                        ),
                        child: Text(
                          'Ksh ${tx.amount.toString()}',
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            tx.title,
                            style: const TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            tx.date.toString(),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                // Text("${e.height}", style: const TextStyle(fontSize: 25)),
                // Text("${e.date}", style: const TextStyle(fontSize: 25))
              ],
            ),
          )
          .toList();
      return childs;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
      ),
      body: Column(
        children: [
          const Card(
            child: Text("chart"),
          ),
          Column(
            children: getList(),
          )
        ],
      ),
    );
  }
}
