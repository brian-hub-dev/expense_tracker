import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  const TransactionList({Key? key, required this.transactions})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List<Widget> getList() {
    //   List<Widget> childs = transactions
    //       .map(
    //         (tx) => Row(
    //           children: <Widget>[
    //             Card(
    //               child: Row(
    //                 children: [
    //                   Container(
    //                     margin: const EdgeInsets.symmetric(
    //                         horizontal: 15.0, vertical: 10.0),
    //                     padding: const EdgeInsets.all(10.0),
    //                     decoration: BoxDecoration(
    //                       border: Border.all(color: Colors.purple, width: 2),
    //                     ),
    //                     child: Text(
    //                       'Ksh ${tx.amount.toString()}',
    //                       style: const TextStyle(
    //                           fontWeight: FontWeight.bold,
    //                           fontSize: 20,
    //                           color: Colors.purple),
    //                     ),
    //                   ),
    //                   Column(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Text(
    //                         tx.title,
    //                         style: const TextStyle(
    //                           fontSize: 16.0,
    //                           fontWeight: FontWeight.bold,
    //                         ),
    //                       ),
    //                       Text(
    //                         DateFormat.yMMMd().format(tx.date),
    //                         style: const TextStyle(
    //                           color: Colors.grey,
    //                         ),
    //                       )
    //                     ],
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             // Text("${e.height}", style: const TextStyle(fontSize: 25)),
    //             // Text("${e.date}", style: const TextStyle(fontSize: 25))
    //           ],
    //         ),
    //       )
    //       .toList();
    //   return childs;
    // }

    return Container(
      height: 500.0,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(height: 15,),
                SizedBox(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemCount: transactions.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(
                            horizontal: 15.0, vertical: 10.0),
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: 2),
                        ),
                        child: Text(
                          'Ksh ${transactions[index].amount.toStringAsFixed(2)}',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            transactions[index].title,
                            style: Theme.of(context).textTheme.titleLarge,
                          ),
                          Text(
                            DateFormat.yMMMd().format(transactions[index].date),
                            style: const TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },
              // child: Column(
              //   children: getList(),
              // ),
            ),
    );
  }
}
