import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  const TransactionList(
      {Key? key, required this.transactions, required this.deleteTx})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              children: [
                Text(
                  'No transaction added yet',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.6,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            );
          })
        : ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                elevation: 5,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: FittedBox(
                          child: Text(
                              'Ksh ${transactions[index].amount.toStringAsFixed(2)}')),
                    ),
                  ),
                  title: Text(
                    transactions[index].title,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transactions[index].date),
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  trailing: mediaQuery.size.width > 460
                      ? ElevatedButton.icon(
                          onPressed: () => deleteTx(transactions[index].id),
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          label: const Text("Delete"))
                      : IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () => deleteTx(transactions[index].id),
                        ),
                ),
              );
            },
          );
  }
}
