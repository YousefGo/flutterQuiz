import 'Qustion.dart';

class Questionbank {
  List<Question> _Question = [
    Question("Java is a statically typed language.", true),
    Question("Java supports multiple inheritance through classes.", false),
    Question("The default value of an uninitialized int variable in Java is 0.",
        true),
    Question(
        "Java programs can run on any device that has the Java Virtual Machine (JVM) installed.",
        true),
    Question(
        "The `main` method in Java can be defined without parameters.", false),
    Question("In Java, `String` is a primitive data type.", false),
    Question("Java uses garbage collection for memory management.", true),
    Question(
        "The `==` operator in Java compares the values of objects.", false),
    Question("Java is platform-independent.", true),
    Question(
        "A `for` loop in Java can be used without an initialization statement.",
        true),
    Question(
        "In Java, you can have multiple `public` classes in a single file.",
        false),
    Question("Java does not support operator overloading.", true),
    Question(
        "The `finally` block in Java is executed whether an exception is thrown or not.",
        true),
    Question(
        "Java does not allow the creation of arrays with a size defined at runtime.",
        false),
    Question(
        "A `null` value can be assigned to any variable of any object type in Java.",
        true),
    Question("In Java, a class can extend multiple classes.", false),
    Question(
        "The `break` statement can be used to exit a loop prematurely in Java.",
        true),
    Question("Interfaces in Java can contain concrete methods.", false),
    Question("Java's `switch` statement can be used with strings.", true),
    Question(
        "A `finally` block in Java will not execute if the JVM exits during the try or catch block.",
        true),
  ];
  int _questionNumber = 0;
  int _score = 0;
  List<Question> getQuestion() {
    return this._Question;
  }

  // go to next question in list
  void nextQuestion() {
    if (!isFinsh()) {
      this._questionNumber++;
    } else {}
  }

  String questionText() {
    return this.getCurrentQuession().text;
  }

  Question getCurrentQuession() {
    return this._Question[_questionNumber];
  }

  bool getCorrectQuestoin() {
    return this.getCurrentQuession().value;
  }

  void reset() {
    this._questionNumber = 0;
  }

  bool isFinsh() {
    return _questionNumber == this._Question.length - 1;
  }

  void updateScore() {
    _score++;
  }

  int getScore() {
    return this._score;
  }

  String showResult() {
    return ((this.getQuestion().length / 2) <= this._score)
        ? "you pass"
        : "you failed ";
  }
}
