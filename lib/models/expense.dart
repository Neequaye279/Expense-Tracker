import 'package:uuid/uuid.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

enum Categoria { food, travel, leisure, work }

const categoryIcons = {
  Categoria.food: Icons.coffee,
  Categoria.travel: Icons.luggage,
  Categoria.leisure: Icons.movie,
  Categoria.work: Icons.work,
};

class Expense {
  Expense({
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final Categoria category;

  String get formattedDate {
    return formatter.format(date);
  }
}

class ExpenseBucket {
  ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses = allExpenses
          .where((expense) => expense.category == category)
          .toList();
          
  final Categoria category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum = sum + expense.amount;
    }
    return sum;
  }
}
