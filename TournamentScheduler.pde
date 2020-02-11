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
  if(tickBoxes[0].getContent()) {
    teams=new String[lines.length][];
    for(int i=0; i<lines.length; i++) {
      teams[i][0]=lines[i];
    }
  } else {
    for(int i=0; i<lines.length; i++) {
      
    }
  }
  int type=radioButtons[0].getContent();
  switch(type) {
    case 0:
      for(int i=0; i<log(teams.length)/log(2); i++) {
        
      }
      break;
    case 1:
      break;
    case 2:
      break;
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
