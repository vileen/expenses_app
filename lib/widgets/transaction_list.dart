import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;

  TransactionList(this.transactions, this.deleteTransaction);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      // use ListView.builder for very long lists and simple ListView for other cases
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text(
                  'No transactions added yet!',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  // widget used as separator
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    'assets/images/waiting.png',
                    // it should take the boundaries of the parent and fit the image to fit
                    // but Column just takes all the width it can take
                    // wrapping it with Container is the solution
                    fit: BoxFit.cover,
                  ),
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
                        padding: EdgeInsets.all(10),
                        child: FittedBox(
                          child: Text('\$${transactions[index].amount}'),
                        ),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      DateFormat.yMMMd().format(transactions[index].date),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTransaction(transactions[index].id),
                    ),
                  ),
                );

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
            ),
    );
  }
}
