
import 'dart:io';

void main() {
  print("Choose your first number: ");
  var first = double.tryParse(stdin.readLineSync()!);

  if (first == null) {
    print("invalid number");
    return;
  }

  print("Please enter an opperator (+, -, *, /): ");
  var operator = OperatorCalculate.get(stdin.readLineSync()!);

  print("Choose your second number: ");
  var second = double.tryParse(stdin.readLineSync()!);

  if (second == null) {
    print("invalid number");
    return;
  }

  print(operator.calculate(first, second));
}

enum Operator { addition, substraction, multiplication, division }

extension OperatorCalculate on Operator {
  static Operator get(String operator) {
    switch(operator) {
        case "+":
          return Operator.addition;
        case "-":
          return Operator.substraction;
        case "*":
          return Operator.multiplication;
        case "/":
          return Operator.division;
        default:
          throw Exception("Invalid operator");
    }
  }

  double calculate(double first, double second) {
      switch(this) {
        case Operator.addition:
          return first + second;
        case Operator.substraction:
          return first - second;
        case Operator.multiplication:
          return first * second;
        case Operator.division:
          return first / second;
      }
  }
}
