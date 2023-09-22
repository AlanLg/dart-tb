
import 'dart:io';

void main() {
  List<QuestionAndAnswers> questionList = [
    QuestionAndAnswers(["Alan", "Jane", "Mike"], 0, "What is my name?"),
    QuestionAndAnswers(["Red", "Blue", "Green"], 1, "What is the color of the sky?"),
    QuestionAndAnswers(["Sword", "Bed", "Orange"], 2, "What is a fruit?"),
  ];

  questionList.forEach((element) { element.askQuestion(); });
}

class QuestionAndAnswers {
  final String _question;
  final List<String> _answers;
  final int _correctAnswerIndex;

  QuestionAndAnswers(this._answers, this._correctAnswerIndex, this._question);

  void askQuestion() {
    print(this._question);
    for (var i = 0; i < this._answers.length; i++) {
        print((i + 1).toString() + ". " + this._answers[i]);
    }
    print("");
    print("Type the number of your answer: ");
    int? answer = int.tryParse(stdin.readLineSync()!);

  if (answer == null) {
    print("invalid number");
    return;
  }

    if ((answer - 1) == _correctAnswerIndex) {
        print("You win");
    } else {
      print("You lose");
    }
  }
}