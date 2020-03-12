class Match {
  PGraphics content=createGraphics(300, 100);
  PVector pos;
  int winner=-1;
  int round;
  TextBox[] scores=new TextBox[2];
  int[] playerInputs=new int[2];
  int[] players={-1, -1};
  Match(boolean inputs, int p1, int p2, int _round) {
    if(inputs) {
      playerInputs[0]=p1;
      playerInputs[1]=p2;
    } else {
      players[0]=p1;
      players[1]=p2;
    }
    round=_round;
    for(int i=0; i<2; i++) {
      scores[i]=new TextBox("", 0, 0, 50, 50);
      scores[i].content="0";
    }
  }
  void update() {
    if(players[0]==players[1]) winner=players[0];
    for(int i=0; i<players.length; i++) {
      if(players[i]==-1) players[i]=matches.get(playerInputs[i]).getWinner();
    }
    content.beginDraw();
    content.fill(255);
    content.rect(0, 0, content.width-1, content.height-1);
    content.line(0, content.height/2, content.width, content.height/2);
    content.textSize(30);
    content.fill(0);
    for(int i=0; i<2; i++) {
      content.text((players[i]==-1)?("Winner of Match "+playerInputs[i]):(teams[players[i]][0]), 5, 33+i*50);
    }
    for(int i=0; i<2; i++) {
      content.image(scores[i].display(false), 250, 50*i);
    }
    content.endDraw();
  }
  void updateText() {
    for(int i=0; i<2; i++) {
      scores[i].updateText();
    }
  }
  void setPos(float x, float y) {
    pos=new PVector(x, y);
    for(int i=0; i<2; i++) {
      scores[i].x=(int)x+250;
      scores[i].y=(int)y+50*i;
    }
  }
  void display() {
    image(content, pos.x, pos.y);
  }
  PGraphics getContent() { return content; }
  int getWinner() { return winner; }
}
