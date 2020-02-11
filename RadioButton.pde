class RadioButton {
  int selection=-1;
  String[] options;
  int x, y, w, h;
  RadioButton(String[] _options, int _x, int _y, int _w, int _h) {
    options=_options;
    x=_x;
    y=_y;
    w=_w;
    h=_h;
  }
  void display() {
    float buttonWidth=w/options.length;
    for(int i=0; i<options.length; i++) {
      if(button(options[i], (int)(x+i*buttonWidth), y, (int)buttonWidth, h, ((selection==i)?224:256))) selection=i;
    }
  }
  int getContent() { return selection; }
}
