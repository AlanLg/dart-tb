
import 'dart:io';

void main() {
  print("Choose your value: ");
  double? value = double.tryParse(stdin.readLineSync()!);

if (value == null) {
    print("invalid number");
    return;
  }

  print("Choose your temperature scale: ");
  TemperatureScale from = TemperatureScale.values.byName(stdin.readLineSync()!);

  print("Choose your new temperature scale: ");
  TemperatureScale to = TemperatureScale.values.byName(stdin.readLineSync()!);

  print(from.convertTemp(value, to));
}

enum TemperatureScale { celcius, fahrenheit, kelvin }

extension Convert on TemperatureScale {
  double convertTemp(double value, TemperatureScale to) {
    if (this == to) {
      return value;
    }

    switch(this) {
        case TemperatureScale.celcius:
          if (to == TemperatureScale.kelvin) {
            return value * 1.8 + 32;
          } else {
            return value + 273.15;
          }
        case TemperatureScale.fahrenheit:
          if (to == TemperatureScale.celcius) {
            return (value - 32) * 5/9;
          } else {
            return (value - 32) * 5/9 + 273.15;
          }
        case TemperatureScale.kelvin:
          if (to == TemperatureScale.fahrenheit) {
            return (value - 273.15) * 9/5 + 32;
          } else {
            return value - 273.15;
          }
    }
  }
}