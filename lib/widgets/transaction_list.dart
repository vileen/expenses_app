import 'package:flutter/material.dart';

import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(
            builder: (ctx, constraints) {
              return Column(
                children: <Widget>[
                  Text(
                    'No transactions added yet!',
                    style: Theme.of(context).textTheme.title,
                  ),
                  const SizedBox(
                    // widget used as separator
                    height: 20,
                  ),
                  Container(
                    height: constraints.maxHeight * 0.6,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      // it should take the boundaries of the parent and fit the image to fit
                      // but Column just takes all the width it can take
                      // wrapping it with Container is the solution
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              );
            },
          )
        : ListView.builder(
            itemBuilder: (ctx, index) {
              return TransactionItem(transactions[index], deleteTransaction);
//                return Card(
//                  child: Row(
//                    children: <Widget>[
//                      Container(
//                        margin: EdgeInsets.symmetric(
//                          vertical: 10,
//                          horizontal: 15,
//                        ),
//                        decoration: BoxDecoration(
//                            border: Border.all(
//                                color: Theme.of(context).primaryColor,
//                                width: 2)),
//                        padding: EdgeInsets.all(10),
//                        child: Text(
//                          '\$${transactions[index].amount.toStringAsFixed(2)}',
//                          style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            fontSize: 20,
//                            color: Theme.of(context).primaryColor,
//                          ),
//                        ),
//                      ),
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            transactions[index].title,
//                            style: Theme.of(context).textTheme.title,
//                          ),
//                          Text(
//                            DateFormat.yMMMd().format(transactions[index].date),
//                            style: TextStyle(
//                              color: Colors.grey,
//                            ),
//                          ),
//                        ],
//                      )
//                    ],
//                  ),
//                );
            },
//      child: ListView(
            itemCount: transactions.length,
          );
  }
}
