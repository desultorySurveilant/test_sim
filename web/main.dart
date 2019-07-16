import 'dart:html';
import 'dart:math';

Random rand = Random();

void main() {
  List party = [randName()];
  var badName = randBadName();
  bool bossFight = false;
  Element e = querySelector('#output')
    ..text = "Your name is ${party[0]}\n"
    ..appendText('You are preparing to go on an adventure\n')
    ..appendText('You must defeat the vile $badName who killed your parents\n')
    ..appendText('But first you must gather allies to aid you in this quest\n');
  while(!bossFight && party.length <5){
    recruitMembers(party, e);
    if(rand.nextInt(3) == 0)bossFight = true;
  }
  e.appendText('The party -- ${partyToString(party)} -- prepares to face the $badName\n');
  if(party.length >= rand.nextInt(5)){
    e.appendText('The valiant ${party[0]} and their fellow companions have vanquished the $badName\n');
    e.appendText('They live out the rest of their lives happily and peacefully\n');
  }else {
    e.appendText('Unfortunately, the noble ${party[0]} and their companions have failed\n');
    e.appendText('They were defeated by the terrible $badName and are locked in prison for the rest of their lives\n');
  }
}
String randName(){
  List nameList = ['Leader1', 'Leader2', 'Leader3', 'Leader4'];
  return nameList[rand.nextInt(nameList.length)];
}
String randBadName(){
  List nameList = ['Necromancer', 'Tyrant', 'Lich', 'Bunny'];
  return nameList[rand.nextInt(nameList.length)];
}
void recruitMembers(List party, Element output){
  party.add('dummy');
  output.appendText('recruiting\n');
}
String partyToString(List l){
  if(l.isEmpty)return 'No members in the party';
  String ret = l[0];
  for(int i = 1; i < l.length; i++){
    ret += ', ${l[i]}';
  }
  return ret;
}