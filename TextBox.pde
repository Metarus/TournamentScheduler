class TextBox {
  boolean selected;
  String content="", header;
  int x, y, w, h;
  TextBox(String _header, int _x, int _y, int _w, int _h) {
    header=_header;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  void display() {
    if(mouseClicked) {
      if(button("", x, y, w, h, 0)) {
        selected=true;
      } else selected=false;
    }
    textAlign(LEFT);
    fill(255);
    rect(x, y, w, h);
    fill(0);
    text(header, x, y-22, w, h);
    text(content, x, y, w, h);
  }
  void updateText() {
    if(selected) {
      if (key==BACKSPACE) {
        if(0<content.length()) {
          content=content.substring(0, content.length()-1);
        }
      } else if(key!=CODED&&key!=ENTER)
      {
        content=content+key;
      }
    }
  }
  String getContent() { return content; }
}
