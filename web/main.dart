import 'dart:html';
import 'dart:math';

Random rand = Random();

void main() {
  var name = randName();
  querySelector('#output').text = 'Your name is $name';
}
String randName(){
  List nameList = ['Alice', 'Bob', 'Claire'];
  return nameList[rand.nextInt(nameList.length)];
} 