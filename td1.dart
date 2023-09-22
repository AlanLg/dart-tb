import 'dart:convert';
import 'dart:io';
import 'dart:math';

void main() {
    var random = Random().nextInt(100);
    var input = -1;

    

    while(random != input) {
        var inputAsString = stdin.readLineSync(encoding: utf8);

        if (!isNumeric(inputAsString)) {
            print("your input is not a number");
            continue;
        }

        input = int.parse(inputAsString!);

        if (input == random) {
            print("congratulations random was " + random.toString());
            break;
        } else if (input > random) {
            print("input is too big");
        } else {
            print("input is too small");
        }
    }
}

bool isNumeric(String? s) {
    if(s == null) {
        return false;
    }
    return int.tryParse(s) != null;
}