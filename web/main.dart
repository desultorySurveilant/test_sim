import 'dart:html';
import 'dart:math';

Random rand = Random();

void main() {
  List party = [randName()];
  querySelector('#output')
    ..text = 'Your name is ${party[0]}\n'
    ..appendHtml('\n')
    ..appendText('You are preparing to go on an adventure');
}
String randName(){
  List nameList = ['Andrea', 'Beatrice', 'Claire', 'Danielle'];
  return nameList[rand.nextInt(nameList.length)];
} 