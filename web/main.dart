import 'dart:html';
import 'dart:math';

Random rand = Random();

void main() {
  var name = randName();
  querySelector('#output').text = 'Your name is $name';
}
String randName(){
  switch (rand.nextInt(1)) {
    case 0:
      return 'Alice';
      break;
    default:
      return 'UNSPEAKABLE';
  }
} 