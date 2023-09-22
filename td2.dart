import 'dart:io';
import 'dart:math';

enum PPC { pierre, papier, ciseaux }
enum Result { win, lose, draw }

extension Message on Result {
  String getMessage() {
      switch(this) {
        case Result.win: 
          return "You win";
        case Result.lose: 
          return "You lose";
        case Result.draw: 
          return "You draw";
      }
  }
}

extension ChooseWinner on PPC {
  Result chooseWinner(PPC ppc) {
      if (this == ppc) {
        return Result.draw;
      }
      switch(this) {
        case PPC.pierre:
          return ppc == PPC.papier ? Result.win : Result.lose;
        case PPC.papier:
          return ppc == PPC.ciseaux ? Result.win : Result.lose;
        case PPC.ciseaux:
          return ppc == PPC.pierre ? Result.win : Result.lose;
      }
  }
}

void main() {
  var random = Random().nextInt(PPC.values.length);
  var input = stdin.readLineSync()!;
  PPC userInputAsPPC = PPC.values.byName(input);
  print(PPC.values[random].chooseWinner(userInputAsPPC).getMessage());
}
