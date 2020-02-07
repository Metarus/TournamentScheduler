String lines[];
int screenState=0;
boolean mouseClicked;
int bracketType=0;

TickBox[] tickBoxes={
  new TickBox("Teams", 400, 200, 100, 50),
  new TickBox("Times", 250, 200, 100, 50),
  new TickBox("Seeding", 100, 200, 100, 50)
};

TextBox[] textBoxes={
  new TextBox("# of team members", 100, 300, 300, 50)
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
  if(tickBoxes[0].getContent()) textBoxes[0].display();
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
