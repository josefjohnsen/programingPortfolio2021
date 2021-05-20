class Button {
  //Member Variables
  int x, y, w, h, size,size1;
  String val;
  color c1, c2,c3,c4;
  boolean hover, isNumber;

  //Constructor
  Button(int tempX, int tempY, int tempW, int tempH, String tempVal, boolean isNumber,int size) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    val = tempVal;
    c1 = #6278AA;
    c2 = #B1BACE;
    c3 = #35549B;
    c4 = #95AFEA;
    hover = false;
    size1 = size;
    this.isNumber= isNumber;
  }

  //Method for Display
  void display() {
    if (isNumber==true) {
      if (hover) {
        fill(c2);
      } else {
        fill(c1);
      }
      rect(x, y, w, h, 8); 
      fill(0);
      textAlign(CENTER);
      textSize(size1);
      text(val, x+w/2, (y+h/2)+10);
    }else{//format a non number button
      if (hover) {
        fill(c4);
      } else {
        fill(c3);
      }
      rect(x, y, w, h, 8); 
      fill(0);
      textAlign(CENTER);
      textSize(size1);
      text(val, x+w/2, (y+h/2)+10);
    }
  }


  //Methods for mouse interaction
  void hover() {
    hover = mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h;
  }
}
