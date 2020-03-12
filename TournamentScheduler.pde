String[][] teams;
String lines[];
int screenState=0;
boolean mouseClicked;
int bracketType=0;

ArrayList<Match> matches=new ArrayList<Match>();

TickBox[] tickBoxes={
  new TickBox("Teams", 400, 200, 100, 50),
  new TickBox("Times", 250, 200, 100, 50),
  new TickBox("Seeding", 100, 200, 100, 50)
};

TextBox[] textBoxes={
};

RadioButton[] radioButtons={
  new RadioButton(new String[] {"Single Elimination", "Double Elimination", "Pools"}, 100, 100, 600, 50)
};

void setup() {
  textSize(20);
  lines=loadStrings("data/teams.txt");
  size(1600, 1600);
}

void draw() {
  background(255);
  switch(screenState) {
    case 0:
      initial();
      break;
    case 1:
      tournamentDisplay();
      break;
  }
  mouseClicked=false;
}

void initial() {
  for(int i=0; i<radioButtons.length; i++) radioButtons[i].display();
  for(int i=0; i<tickBoxes.length; i++) tickBoxes[i].display();
  if(button("Next Page", 500, 500, 100, 100, color(0, 255, 0))) {
    createTournament();
    screenState++;
  }
}

void tournamentDisplay() {
  for(int i=0; i<matches.size(); i++) matches.get(i).update();
  for(int i=0; i<matches.size(); i++) matches.get(i).display();
  
}

void createTournament() {
  if(!tickBoxes[0].getContent()) {
    teams=new String[lines.length][1];
    for(int i=0; i<lines.length; i++) {
      teams[i][0]=lines[i];
    }
  } 
  int type=radioButtons[0].getContent();
  switch(type) {
    case 0:
      createSingleElim(0, 0, teams.length-1);
      setTournamentDisplay();
      break;
    case 1:
      break;
    case 2:
      break;
  }
}

void createSingleElim(int round, int firstMatch, int lastMatch) {
  if(firstMatch==lastMatch) return;
  for(int i=firstMatch; i<lastMatch+1; i+=2) {
    if(i>=lastMatch) {
      matches.add(new Match(round!=0, i, i, round));
    } else matches.add(new Match(round!=0, i, i+1, round));
  }
  if(round==0) {
    createSingleElim(round+1, 0, matches.size()-1);
  } else createSingleElim(round+1, lastMatch+1, matches.size()-1);
}

void setTournamentDisplay() {
  int round=0;
  int resetYVal=60;
  int yVal=resetYVal-10;
  for(int i=0; i<matches.size(); i++) {
    if(round!=matches.get(i).round) {
      round=matches.get(i).round;
      resetYVal*=2;
      yVal=resetYVal-10;
    }
    matches.get(i).setPos(50+matches.get(i).round*320, yVal);
    yVal+=120*(Math.pow(2, round));
  }
}

void updateMatches() {
  for(int i=0; i<matches.size(); i++) {
    for(int j=0; j<matches.get(i).players.length; j++) {
      //Somewhat strange line, effectively checks if the player is set, if not, then update it by checking player inputs
      //This requires multiple layers of getting details from matches, but it works
      if(matches.get(i).players[j]==-1) matches.get(i).players[j]=matches.get(matches.get(i).playerInputs[j]).winner;
    }
  }
}

boolean button(String str, int x, int y, int w, int h, color clr) {
  fill(clr);
  rect(x, y, w, h);
  textAlign(CENTER);
  fill(0);
  text(str, x+w/2, y+h/2);
  if(x<mouseX&&mouseX<x+w&&y<mouseY&&mouseY<y+h&&mouseClicked) return true;
  return false;
}

void mouseClicked() {
  mouseClicked=true;
}

void keyPressed() {
  for(int i=0; i<matches.size(); i++) matches.get(i).updateText();
  for(int i=0; i<textBoxes.length; i++) textBoxes[i].updateText();
}
