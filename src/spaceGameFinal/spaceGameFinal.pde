//Space Game | December 2020
//Josef Johnsen
//TODO: Project Setup
import processing.sound.*;
SoundFile laser;
SpaceShip s1;
Animation rockMove, rockBreak, powerMove, powerBreak;
ArrayList<Lazer> lazers;
ArrayList<Rock> rocks;
ArrayList<PowerUp> powerUps;
ArrayList<Star> stars;
ArrayList<EnemyShip> enShs;
Timer timer1, timer2, timer3;
int score, pass, counter, level;
boolean play;
float test;

void setup() {
  size(500, 500);
  laser = new SoundFile(this, "Narn-FighterGun.wav");
  score = 0;
  test = 0;
  pass = 0;
  level = 0;
  play = false;
  s1 = new SpaceShip(#866B6B);
  lazers = new ArrayList();
  rocks = new ArrayList();
  enShs = new ArrayList();
  stars = new ArrayList();
  rockMove = new Animation("");
  powerMove = new Animation("");
  powerUps = new ArrayList();
  timer1 = new Timer(int(random(500, 1000)));
  timer1.start();
  timer2 = new Timer(int(random(10000, 50000)));
  timer2.start();
  timer3 = new Timer(int(random(5000, 10000)));
  timer3.start();
}

void draw() {
  noCursor();

  if (!play) {
    startScreen();
  } else {
    background(0);

    stars.add(new Star(int(random(width)), 0));

    for (int i = 0; i < stars.size(); i++) {
      Star star = stars.get(i);
      star.display();
      star.move();
      if (star.reachedBottom()) {
        stars.remove(star);
      }
      test += star.speed;
    }

    test = 0;

    if (timer1.isFinished()) {
      rocks.add(new Rock(int(random(width)), -50,"rockMove",4));
      timer1.start();
    }
    if (timer2.isFinished()) {
      powerUps.add(new PowerUp(int(random(width)), -50,"powerMove",4));
      timer2.start();
    }
    if(timer3.isFinished()){
      enShs.add(new EnemyShip(#866B6B));
      timer3.start();
    }

    for (int i = 0; i < rocks.size(); i++) {
      Rock rock = rocks.get(i);
      rock.display(int(random(10,490)),-50);
      rock.move();
      //colliton between ship and rock
      if (s1.rockIntersection(rock)) {
        rocks.remove(rock);
        s1.health -= 10;
        score -= 5;
        s1.lazers = 1;
      }
      if (rock.reachedBottom()) {
        rocks.remove(rock);
        pass++;
      }
    }

    //for (int i = 0; i < enShs.size(); i++) { //<>//
    //  //EnemyShip ensh = enShs.get(i);
    //  //ensh.display(300,400);
      
    //}


    for (int i = 0; i < powerUps.size(); i++) {
      PowerUp powerUp = powerUps.get(i);
      powerUp.display(int(random(10,490)),-50);
      powerUp.move();
      //colliton between ship and rock
      if (s1.powerUpIntersection(powerUp)) {
        powerUps.remove(powerUp);
        powerUp.effect();
        score += 20;
      }
      if (powerUp.reachedBottom()) {
        powerUps.remove(powerUp);
      }
    }

    for (int i = 0; i < lazers.size(); i++) {
      Lazer lazer = lazers.get(i);
      lazer.display();
      lazer.fire();
      //dectect rock collision
      for (int j = 0; j< rocks.size(); j++) {
        Rock rock = rocks.get(j);
        if (rock.lazerIntersection(lazer)) {
          lazers.remove(lazer);
          rock.health-=lazer.damage;
          if (rock.health<1) {
            rocks.remove(rock);
            score += 20;
            counter ++;
          }
        }
      }

      if (lazer.reachedTop()) {
        lazers.remove(lazer);
      }
    }

    infoPanel();
    s1.display(mouseX, mouseY);

    levelUp();
    

    
    // Game Over Logic
    if (s1.health<1 || pass >10) {
      play = false;
      gameOver();
    }
  }
    println(enShs.size());
}

void mousePressed() {
  if (s1.ammo>0) {
    if (s1.lazers < 10) {
      for (int i = 0; i<s1.lazers; i++) {
        lazers.add(new Lazer(s1.x+(i*10), s1.y));
        laser.play();
        s1.ammo --;
      }
    }
  }
}

void keyPressed() {
  lazers.add(new Lazer(s1.x, s1.y));
}

void infoPanel() {
  fill(128, 128);
  rectMode(CORNER);
  rect(0, height-50, width, height);
  fill(255, 128);
  text("Health: " + s1.health, 50, height-20);
  text("Ammo: "+ s1.ammo, 175, height-20);
  text("Level: "+ level, 300, height-20);
  text("Score: " + score, 425, height-20);
  fill(200, 100);
  stroke(5);
  rect(50, 30, 400, 10);
  noStroke();
  fill(#4FFA08, 100);
  if (s1.health <= 100) {
    rect(50, 30, (s1.health*4), 10);
  } else {
    rect(50, 30, 400, 10);
  }
  if (pass > 7) {
    fill(255, 0, 0);
  }
  text("Pass: " + pass, 420, height-30);
}

void startScreen() {
  background(0);
  textAlign(CENTER);
  if(level == 0){
  text("Welcome!", width/2, height/2);
  text("Pless space to Start!", width/2, height/2+20);
  }
  if (level == 1){
  text("Level 1 complete!", width/2, height/2);
  text("Pless space to Continue! ", width/2, height/2+20);
  }
  if (level == 2){
  text("Level 2 complete!", width/2, height/2);
  text("Pless space to Continue! ", width/2, height/2+20);
  }
  if (level == 3){
  text("You WON!!!", width/2, height/2);
  text("If you wish, press space to get a high score!", width/2, height/2+20);
  }
  if (keyPressed) {
    play = true;
    level ++;
  }
}

void gameOver() {
  background(0);
  textAlign(CENTER);
  fill(222);
  text("Game Over!", width/2, height/2);
  text("Final Score: " + score, width/2, height/2+20);
  noLoop();
}

void levelUp() {
  if (level == 1 && counter >= 1) {
    play = false;
  }
  if(level == 2 && counter >= 30){
    play = false;
  }
}
