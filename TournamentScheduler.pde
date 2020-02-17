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
  size(800, 800);
}

void draw() {
  background(255);
  switch(screenState) {
    case 0:
      initial();
      break;
    case 1:
      break;
  }
  mouseClicked=false;
}

void initial() {
  for(int i=0; i<radioButtons.length; i++) radioButtons[i].display();
  for(int i=0; i<tickBoxes.length; i++) tickBoxes[i].display();
  if(button("Next Page", 500, 500, 100, 100, color(0, 255, 0))) {
    screenState++;
    createTournament();
  }
}

void createTournament() {
  if(!tickBoxes[0].getContent()) {
    teams=new String[lines.length+1][1];
    for(int i=0; i<lines.length; i++) {
      teams[i][0]=lines[i];
    }
  } else {
    for(int i=0; i<lines.length; i++) {
      
    }
  }
  for(int i=0; i<teams.length; i++) {
    println(teams[i][0]);
  }
  int type=radioButtons[0].getContent();
  switch(type) {
    case 0:
      createSingleElim(0, 0, teams.length);
      break;
    case 1:
      break;
    case 2:
      break;
  }
  for(int i=0; i<matches.size(); i++) {
    println(i+" "+matches.get(i).players[0]+" "+matches.get(i).players[1]+" "+matches.get(i).playerInputs[0]+" "+matches.get(i).playerInputs[1]);
  }
}

void createSingleElim(int round, int firstMatch, int lastMatch) {
    for(int i=firstMatch; i<lastMatch; i+=2) {
    if(round==0) {
      matches.add(new Match(false, i, i+1));
    } else {
      if(i>lastMatch) {
        matches.add(new Match(true, i, i));
      } else matches.add(new Match(true, i, i+1));
    }
  }
  println(firstMatch+" "+lastMatch+" "+round);
  if(round==0) {
    createSingleElim(round+1, 0, matches.size()-1);
  } else if(lastMatch-firstMatch>1) createSingleElim(round+1, lastMatch, matches.size());
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
  for(int i=0; i<textBoxes.length; i++) textBoxes[i].updateText();
}
