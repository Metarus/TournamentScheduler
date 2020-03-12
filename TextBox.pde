class TextBox {
  PGraphics text;
  boolean selected;
  String content="", header;
  int x, y, w, h;
  TextBox(String _header, int _x, int _y, int _w, int _h) {
    header=_header;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
    text=createGraphics(w-1, h-1);
  }
  PGraphics display(boolean display) {
    if(mouseClicked) {
      if(button("", x, y, w, h, 0)) {
        selected=true;
      } else selected=false;
    }
    text.beginDraw();
    text.textAlign(LEFT);
    text.textSize(30);
    text.fill(255);
    text.rect(0, 0, w, h);
    text.fill(0);
    text.text(header, 0, -22, w, h);
    text.text(content, 0, 0, w, h);
    text.endDraw();
    if(display) image(text, x, y);
    return text;
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
