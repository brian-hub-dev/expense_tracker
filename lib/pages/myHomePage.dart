import 'package:flutter/material.dart';
import '/widgets/user_transaction.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Planner'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: double.infinity,
              child: const Card(
                elevation: 5.0,
                child: Text("chart"),
              ),
            ),
            const UserTransaction(),
          ],
        ),
      ),
    );
  }
}
