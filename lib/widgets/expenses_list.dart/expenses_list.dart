import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expenseList,
    required this.onRemoved,
  });

  final List<Expense> expenseList;
  final void Function(Expense expense) onRemoved;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expenseList.length,
      itemBuilder: (ctx, index) {
        return Dismissible(
          key: ValueKey(expenseList[index]),
          background: Container(
            color: Theme.of(context).colorScheme.error,
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          onDismissed: (direction) {
            onRemoved(expenseList[index]);
          },
          child: ExpensesItem(expense: expenseList[index]),
        );
      },
    );
  }
}
