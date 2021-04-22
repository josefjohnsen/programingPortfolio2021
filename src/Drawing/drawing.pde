//Josef Johnsen (made for fun)

int size,color1,color2,color3,colorr1,colorr2,colorr3,helpper,rgbtest,boxX,boxY,rcolor,gcolor,bcolor;

void setup(){
  size(400,400);
  background(255);
  strokeWeight(1);
  frameRate(200);
  size = 40;
  color1 = 0;
  helpper = 0;
  rgbtest = 0;
  boxX= width-110;
  boxY= height-110;
}

void draw(){
  
  
  rgb();
  erase();
  toolbar();
  colorBox(10,255,0,0);
  colorBox(40,255,128,0);
  colorBox(70,255,255,0);
  colorBox(100,0,255,0);
  colorBox(130,0,255,255);
  colorBox(160,0,0,255);
  colorBox(190,127,0,255);
  colorBox(220,255,0,255);
  colorBox(250,0,0,0);
  colorBox(280,255,255,255);
  sizeModify(308,10);
  sizeModify(320,20);
  sizeModify(345,30);
  sizeModify(378,40);
  if (mousePressed == true && rgbtest == 0){
    noStroke();
    fill(colorr1,colorr2,colorr3);
    ellipse(mouseX,mouseY,size,size);
    stroke(1);
  }
}

void colorBox(int x, int color1,int color2, int color3){
  fill(color1,color2,color3);
  rect(x,height-30,20,20);
  if (mouseX > x && mouseX < x+20 && mouseY > height-30 && mouseY <height-10 && mousePressed){
   colorr1 = color1;
   colorr2 = color2;
   colorr3 = color3;
}
}

void sizeModify(int x, int sizee){
  fill(0);
  ellipse(x,height-20,sizee,sizee);
  if (mouseX > x-(size) && mouseX < x+(size) && mouseY > height-20-(size) && mouseY <height+20+(size) && mousePressed){
    size = sizee;
  }
}

void toolbar(){
  fill(200);
  rect(0,height-40,width,40);
  
 
}

void erase(){
  fill(200);
  rect(width-40,0,40,40);
  fill(20);
  rect(width-35,5,30,30);
  fill(255);
  triangle(width-20,10,width-30,30,width-10,30);
  if(mouseX>width-35 && mouseX<width-5 && mouseY > 5 && mouseY < 35 && mousePressed == true){
    //for(int i = height;i>0;i--){
    //  noStroke();
    //  fill(255);
    //  triangle(width/2,i,(width/2)-5,i-10,(width/2)+5,i-10);
    //  stroke(1);
    //}
    noStroke();
    fill(255);
    rect(0,0,width,height);
    stroke(1);
  }
}

void rgb(){
  fill(200);
  rect(width-40,40,40,40);
  fill(255,0,0);
  ellipse(width-27,55,15,15);
  fill(0,255,0);
  ellipse(width-20,68,15,15);
  fill(0,0,255);
  ellipse(width-13,55,15,15);
  
  if(mouseX>width-35 && mouseX<width && mouseY>45 && mouseY<75 && mousePressed == true){
    rgbtest = 1;
  }
  if(rgbtest == 1){
    fill(200);
    rect(30,30,width-80,height-80);
    for(int i = 0;i<255;i++){
      noStroke();
      fill(i,0,0);
      rect(50,50+i,20,1);
      stroke(1);
    }
     for(int i = 0;i<255;i++){
      noStroke();
      fill(0,i,0);
      rect(100,50+i,20,1);
      stroke(1);
    }
     for(int i = 0;i<255;i++){
      noStroke();
      fill(0,0,i);
      rect(150,50+i,20,1);
      stroke(1);
    }
    if(mouseX>50 && mouseX<70 && mouseY>50 && mouseY<305 && mousePressed == true){
      rcolor = mouseY-50;
    }
    if(mouseX>100 && mouseX<120 && mouseY>50 && mouseY<305 && mousePressed == true){
      gcolor = mouseY-50;
    }
    if(mouseX>150 && mouseX<170 && mouseY>50 && mouseY<305 && mousePressed == true){
      bcolor = mouseY-50;
    }
    fill(rcolor,gcolor,bcolor);
    rect(200,50,50,255);
    fill(0,255,0);
    rect(50,320,100,20);
    fill(0);
    text("Set",55,335);
    if(mouseX>50 && mouseX<150 && mouseY>320 && mouseY<340 && mousePressed == true){
      colorr1 = rcolor;
      colorr2 = gcolor;
      colorr3 = bcolor;
      rgbtest = 0;
      noStroke();
      fill(255);
      rect(30,30,width-79,height-79);
      stroke(1);
    }
  }
}
