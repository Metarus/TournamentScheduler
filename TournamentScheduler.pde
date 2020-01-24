String lines[];
int screenState=0;
boolean mouseClicked;
int bracketType=0;

TextBox[] textBoxes={
  
};

RadioButton[] radioButtons={
  new RadioButton(new String[] {"Single Elimination", "Double Elimination", "Pools"}, 100, 100, 600, 50)
};

void setup() {
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
