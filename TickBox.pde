class TickBox {
  boolean selection;
  int x, y, w, h;
  String str;
  TickBox(String _str, int _x, int _y, int _w, int _h) {
    str=_str;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  void display() {
    if(button(str, x, y, w, h, ((selection)?224:256))) selection=!selection;
  }
  boolean getContent() { return selection; }
}
