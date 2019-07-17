import 'dart:html';
import 'dart:math';

Random rand = Random();

void main() {
  List party = [randName()];
  var badName = randBadName();
  bool bossFight = false;
  int maxParty = 6;
  double bossFightOdds = 0.2;
  double oddsIncrementPerRecruit = 0.1;

  Element e = querySelector('#output')
    ..text = "You are a young ${party[0]}.\n"
    ..appendText('You are preparing to go on an adventure.\n')
    ..appendText('You must defeat the vile $badName who killed your parents.\n')
    ..appendText('But first you must gather allies to aid you in this quest.\n');
  while(!bossFight && party.length < maxParty){
    recruitMembers(party, e);
    if(rand.nextDouble() < bossFightOdds){
      bossFight = true;
    }else{
      bossFightOdds += oddsIncrementPerRecruit;
    }
  }
  e.appendText('Your party -- ${partyToString(party)} -- prepares to face the ${badName}.\n');
  if(party.length >= rand.nextInt(maxParty)){
    e.appendText('The valiant ${party[0]} and their fellow companions have vanquished the ${badName}.\n');
    e.appendText('They live out the rest of their lives happily and peacefully.\n');
  }else {
    e.appendText('Unfortunately, the noble ${party[0]} and their companions have failed.\n');
    e.appendText('They were defeated by the terrible $badName and are locked in prison for the rest of their lives.\n');
  }
}
String randName(){
  List nameList = ['Paladin', 'Wizard', 'Ranger', 'Cleric'];
  return nameList[rand.nextInt(nameList.length)];
}
String randBadName(){
  List nameList = ['Necromancer', 'Tyrant', 'Lich', 'Bunny'];
  return nameList[rand.nextInt(nameList.length)];
}
void recruitMembers(List party, Element output){
  List followList = ['Warrior', 'Scholar', 'Hunter', 'Acolyte'];
  String recruitee = followList[rand.nextInt(followList.length)];
  party.add(recruitee);
  output.appendText('You have recruited a new ${recruitee}!\n');
}
String partyToString(List l){
  if(l.isEmpty)return 'No members in the party';
  String ret = l[0];
  for(int i = 1; i < l.length; i++){
    ret += ', ${l[i]}';
  }
  return ret;
}