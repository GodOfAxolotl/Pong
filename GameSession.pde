class GameSession {

  int runde;          
  int pp;
  int op;
  int ii = 0;
  int w;
  int h;
  float tollerance = 2;
  boolean twoplayer = false;


  GameLayout game = new GameLayout();

  GameSession() {
    rectMode(CENTER);    
    reset(true);
    surface.setTitle("Press W to start!");
    surface.setResizable(true);
    surface.setLocation(300, 300);
    noLoop();
    textSize(42);
  }

  void gameLoop() {

    background(0, 10);
    surface.setTitle("Pong");
    for (int i = 0; i < height / 20; i++) {
      rect(width/2 - 5, i * 20, 5, 10 );
    }

    game.update(this);
    game.display();

    refreshWhenResized();
    writeTextToScreen();  //SchriftT
  }

  ////////////////////////////////////////////

  void refreshWhenResized() {
    if (w != width || h != height) {
      reset(false); 
      w = width;
      h = height;
    }    //Wurde das Fenster in seiner Größe geändert? Aktualisieren!
  }


  //////////////////////////////////////////////////////////////////////////////////////

  void writeTextToScreen() {
    fill(255);
    textSize(12);
    text("Ballwechsel: " + runde, width - 130, 20);  //Counter
    text("Schwierigkeit: " + str(tollerance), width - 130, 40);
    textSize(32);
    text(str(pp) + "  :  " + str(op), width / 2 - 50, 40);

    if (ii == 0) {
      text("Press W or S to start!", width / 2 - 400, height / 6);
      text("Arrowkeys for Player 2", width / 2 - 400, height / 6 + 46);
      text("Press r to reset the game", width / 2 - 400, height / 6 + 2 * 46);
      ii++;
    } 
    //Im Ersten durchlauf wird ein kleines Tutorial gezeigt
  }

  //////////////////////////////////////////////////////////////////////////////////////////

  void reset(boolean d) {

    runde = 0;
    float speed = random(-4, 4);
    boolean b = false;
    if (pp == op) {
      while (!b) {
        if (speed > -3 && speed < 3) {
          speed = random(-4, 4);
        } else {
          b = true;
        }
      }
    } else if (pp > op) {
      speed = 4;
    } else if (op > pp) {
      speed = -4;
    }

    game.ball = new Ball(width/2, height/2, speed * (width/800), random(-1, 1), 20 * (height/500)); 
    game.player = new Paddle(width / 40, height/2, height / 5, 5 * ( height / 500), true);
    game.opp = new Paddle(width - width / 40, height/2, height / 5, 5 * ( height / 500), false);

    if (d) {
      pp = 0;
      op = 0;
    }
  }
}
