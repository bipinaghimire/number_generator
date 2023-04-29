import 'dart:math';

class NumberGeneratorModel {
  List<int> generateRandom() {
    var randomNum1 = Random().nextInt(100);
    var randomNum2 = Random().nextInt(100);

    if (randomNum1 != randomNum2) {
      return [randomNum1, randomNum2];
    } else {
      return generateRandom();
    }
  }
}
